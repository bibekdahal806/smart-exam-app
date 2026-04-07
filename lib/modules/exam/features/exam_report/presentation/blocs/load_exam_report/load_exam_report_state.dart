part of 'load_exam_report_cubit.dart';

const _selectedSubjectNoChange = Object();

class LoadExamReportState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamReportEntity> allReports;
  final List<ExamReportEntity> reports;
  final List<String> availableSubjects;
  final String? selectedSubject;
  final String? error;

  const LoadExamReportState({
    this.loadingState = AppLoadingState.initial,
    this.allReports = const [],
    this.reports = const [],
    this.availableSubjects = const [],
    this.selectedSubject,
    this.error,
  });

  LoadExamReportState copyWith({
    AppLoadingState? loadingState,
    List<ExamReportEntity>? allReports,
    List<ExamReportEntity>? reports,
    List<String>? availableSubjects,
    Object? selectedSubject = _selectedSubjectNoChange,
    String? error,
  }) {
    return LoadExamReportState(
      loadingState: loadingState ?? this.loadingState,
      allReports: allReports ?? this.allReports,
      reports: reports ?? this.reports,
      availableSubjects: availableSubjects ?? this.availableSubjects,
      selectedSubject: selectedSubject == _selectedSubjectNoChange
          ? this.selectedSubject
          : selectedSubject as String?,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    loadingState,
    allReports,
    reports,
    availableSubjects,
    selectedSubject,
    error,
  ];
}
