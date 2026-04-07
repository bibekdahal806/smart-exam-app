import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'load_exam_report_state.dart';

class LoadExamReportCubit extends Cubit<LoadExamReportState> {
  final RemoteExamReportRepository _remoteExamReportRepository =
      getIt<RemoteExamReportRepository>();

  LoadExamReportCubit() : super(const LoadExamReportState());

  Future<void> loadExamReport() async {
    emit(state.copyWith(loadingState: AppLoadingState.loading, error: null));

    try {
      final result = await _remoteExamReportRepository.getExamReports();
      final subjects =
          result
              .map((report) => (report.subjectName ?? '').trim())
              .where((subject) => subject.isNotEmpty)
              .toSet()
              .toList()
            ..sort();

      emit(
        state.copyWith(
          loadingState: AppLoadingState.success,
          allReports: result,
          reports: result,
          availableSubjects: subjects,
          selectedSubject: null,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  Future<void> reloadExamReport() async {
    return loadExamReport();
  }

  void filterBySubject(String? subjectName) {
    final normalizedSubject = (subjectName ?? '').trim();

    if (normalizedSubject.isEmpty) {
      emit(
        state.copyWith(
          reports: state.allReports,
          selectedSubject: null,
          error: state.error,
        ),
      );
      return;
    }

    final filtered = state.allReports.where((report) {
      return (report.subjectName ?? '').trim() == normalizedSubject;
    }).toList();

    emit(
      state.copyWith(
        reports: filtered,
        selectedSubject: normalizedSubject,
        error: state.error,
      ),
    );
  }
}
