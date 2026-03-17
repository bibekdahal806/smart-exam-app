part of 'load_exam_report_cubit.dart';

class LoadExamReportState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamReportEntity> reports;
  final String? error;

  const LoadExamReportState({
    this.loadingState = AppLoadingState.initial,
    this.reports = const [],
    this.error,
  });

  LoadExamReportState copyWith({
    AppLoadingState? loadingState,
    List<ExamReportEntity>? reports,
    String? error,
  }) {
    return LoadExamReportState(
      loadingState: loadingState ?? this.loadingState,
      reports: reports ?? this.reports,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loadingState, reports, error];
}
