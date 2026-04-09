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

  String? _normalizeAccessType(String? accessType) {
    final normalized = accessType?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) return null;
    if (normalized == 'free' || normalized == 'assigned') return normalized;
    return null;
  }

  List<ExamEntity> _applyAccessTypeFilter(
    List<ExamEntity> exams,
    String? accessType,
  ) {
    final normalized = _normalizeAccessType(accessType);
    if (normalized == null) return List<ExamEntity>.from(exams);

    return exams
        .where((exam) => exam.normalizedAccessType == normalized)
        .toList();
  }

  Future<void> loadExams(ExamScreenArgument argument) async {
    final sameArgument = state.argument == argument;

    if (sameArgument &&
        state.loadingState.isSuccess &&
        state.allExams.isNotEmpty) {
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

      final filtered = _applyAccessTypeFilter(result, state.selectedAccessType);

      emit(
        state.copyWith(
          loadingState: AppLoadingState.success,
          allExams: result,
          exams: filtered,
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

  void filterByAccessType(String? accessType) {
    final normalized = _normalizeAccessType(accessType);
    emit(
      state.copyWith(
        exams: _applyAccessTypeFilter(state.allExams, normalized),
        selectedAccessType: normalized,
        error: null,
      ),
    );
  }
}
