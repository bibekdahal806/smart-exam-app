import 'package:diffutil_sliverlist/diffutil_sliverlist.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

/// Renders an exam as a flat survey (no inner-branching).
class Survey extends StatefulWidget {
  final ExamEntity exam;

  /// Called whenever answers change.
  final void Function(List<QuestionResultEntity> results)? onChange;

  /// Optional custom builder per question.
  final Widget Function(
    BuildContext context,
    QuestionEntity question,
    List<String> value,
    void Function(List<String>) update,
  )?
  builder;

  final String? defaultErrorText;

  const Survey({
    super.key,
    required this.exam,
    this.onChange,
    this.builder,
    this.defaultErrorText,
  });

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final Map<String, List<String>> _answersByQuestionId = {};

  List<QuestionResultEntity> _buildResults() {
    return widget.exam.questions
        .where((q) => (q.id ?? '').trim().isNotEmpty)
        .map((q) {
          final id = q.id!.trim();
          return QuestionResultEntity(
            questionId: id,
            answers: _answersByQuestionId[id] ?? const [],
          );
        })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final builder =
        widget.builder ??
        (context, q, value, update) => QuestionCard(
          key: ValueKey(q.id ?? q.text),
          question: q,
          value: value,
          update: update,
          defaultErrorText: 'This field is mandatory*',
          // defaultErrorText:
          //     q.errorText ??
          //     (widget.defaultErrorText ?? 'This field is mandatory*'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );

    final children = widget.exam.questions.map((q) {
      final id = (q.id ?? '').trim();
      final value = id.isEmpty
          ? const <String>[]
          : (_answersByQuestionId[id] ?? const []);

      return builder(context, q, value, (newValue) {
        if (id.isNotEmpty) {
          _answersByQuestionId[id] = newValue;
        }
        setState(() {});
        widget.onChange?.call(_buildResults());
      });
    }).toList();

    return CustomScrollView(
      slivers: [
        DiffUtilSliverList.fromKeyedWidgetList(
          children: children,
          insertAnimationBuilder: (context, animation, child) =>
              FadeTransition(opacity: animation, child: child),
          removeAnimationBuilder: (context, animation, child) => FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
