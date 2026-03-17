import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'load_exams_state.dart';

class LoadExamsCubit extends Cubit<LoadExamsState> {
  final RemoteExamRepository _remoteExamRepository =
      getIt<RemoteExamRepository>();

  LoadExamsCubit() : super(const LoadExamsState());

  Future<void> loadExams(ExamScreenArgument argument) async {
    final sameArgument = state.argument == argument;

    if (sameArgument &&
        state.loadingState.isSuccess &&
        state.exams.isNotEmpty) {
      return;
    }

    emit(
      state.copyWith(
        loadingState: AppLoadingState.loading,
        argument: argument,
        error: null,
      ),
    );

    try {
      final List<ExamEntity> result;

      if (argument.loadAll) {
        result = await _remoteExamRepository.getExams();
      } else {
        final subjectId = (argument.subjectId ?? '').trim();

        if (subjectId.isEmpty) {
          emit(
            state.copyWith(
              loadingState: AppLoadingState.failure,
              argument: argument,
              error: 'Subject id is missing.',
            ),
          );
          return;
        }

        result = await _remoteExamRepository.getExamsBySubjectId(subjectId);
      }

      emit(
        state.copyWith(
          loadingState: AppLoadingState.success,
          exams: result,
          argument: argument,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          argument: argument,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> reloadExams() async {
    final argument = state.argument;
    if (argument == null) return;
    return loadExams(argument);
  }
}
