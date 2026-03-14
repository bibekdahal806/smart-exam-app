import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final ExamDetailArgument argument;
  const ExamDetailScreen({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExamSessionCubit()
            ..startOrResume(argument.exam, initialSession: argument.session),
      child: ExamDetailScreenView(),
    );
  }
}

class ExamDetailScreenView extends StatefulWidget {
  const ExamDetailScreenView({super.key});

  @override
  State<ExamDetailScreenView> createState() => _ExamDetailScreenViewState();
}

class _ExamDetailScreenViewState extends State<ExamDetailScreenView>
    with WidgetsBindingObserver {
  late final PageController _pageController;
  bool _didApplyInitialPage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      context.read<ExamSessionCubit>().syncClock();
    }
  }

  void _syncPageWithState(int index, {bool animated = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_pageController.hasClients) return;

      final currentPage = _pageController.page?.round() ?? 0;
      if (currentPage == index) return;

      if (animated) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      } else {
        _pageController.jumpToPage(index);
      }
    });
  }

  Future<void> _confirmSubmit(BuildContext context) async {
    final cubit = context.read<ExamSessionCubit>();
    final ok =
        await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Submit exam?'),
            content: const Text(
              'Once submitted, this attempt will be finished.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Submit'),
              ),
            ],
          ),
        ) ??
        false;
    if (ok) {
      await cubit.submit();
    }
  }

  Future<void> _openJumpSheet(
    BuildContext context,
    ExamSessionState state,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<ExamSessionCubit>(),
        child: QuestionJumpSheet(
          totalQuestions: state.totalQuestions,
          currentIndex: state.currentIndex,
          isAnswered: (index) {
            final question = state.exam.questions[index];
            return context.read<ExamSessionCubit>().isQuestionAnswered(
              question,
            );
          },
          onTap: (index) async {
            Navigator.pop(context);
            await context.read<ExamSessionCubit>().goToIndex(index);
            _syncPageWithState(index);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamSessionCubit, ExamSessionState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.currentIndex != current.currentIndex,
      listener: (context, state) async {
        if (state.status == ExamSessionStatus.ready ||
            state.status == ExamSessionStatus.submitting ||
            state.status == ExamSessionStatus.submitted ||
            state.status == ExamSessionStatus.expired) {
          _syncPageWithState(
            state.currentIndex,
            animated: _didApplyInitialPage,
          );
          _didApplyInitialPage = true;
        }

        if (state.status == ExamSessionStatus.submitted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Exam submitted successfully.')),
          );
          Navigator.of(context).maybePop(true);
        }

        if (state.status == ExamSessionStatus.expired && state.autoSubmitted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Time is over. The exam was auto-submitted.'),
            ),
          );
          Navigator.of(context).maybePop(true);
        }

        if (state.status == ExamSessionStatus.failure && state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      builder: (context, state) {
        if (state.status == ExamSessionStatus.loading ||
            state.status == ExamSessionStatus.initial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == ExamSessionStatus.failure &&
            state.exam.questions.isEmpty) {
          return Scaffold(
            body: Center(child: Text(state.error ?? 'Unable to open exam.')),
          );
        }

        if (!_didApplyInitialPage) {
          _syncPageWithState(state.currentIndex, animated: false);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(state.exam.title ?? 'Exam'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: ExamTimerText(
                    remainingSeconds: state.remainingSeconds,
                  ),
                ),
              ),
            ],
          ),
          body: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.totalQuestions,
            itemBuilder: (context, index) {
              final question = state.exam.questions[index];
              final value =
                  state.answersByQuestionId[(question.id ?? '').trim()] ??
                  const <String>[];

              return QuestionCard(
                index: index,
                total: state.totalQuestions,
                question: question,
                value: value,
                onChanged: (answers) {
                  final id = (question.id ?? '').trim();
                  if (id.isNotEmpty) {
                    context.read<ExamSessionCubit>().updateAnswer(
                      questionId: id,
                      answers: answers,
                    );
                  }
                },
              );
            },
          ),
          bottomNavigationBar: ExamBottomBar(
            hasPrevious: state.hasPrevious,
            hasNext: state.hasNext,
            currentIndex: state.currentIndex,
            totalQuestions: state.totalQuestions,
            onPrevious: () =>
                context.read<ExamSessionCubit>().previousQuestion(),
            onNext: () => context.read<ExamSessionCubit>().nextQuestion(),
            onJump: () => _openJumpSheet(context, state),
            onSubmit: () => _confirmSubmit(context),
          ),
        );
      },
    );
  }
}
