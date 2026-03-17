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

      emit(
        state.copyWith(
          loadingState: AppLoadingState.success,
          reports: result,
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
}
