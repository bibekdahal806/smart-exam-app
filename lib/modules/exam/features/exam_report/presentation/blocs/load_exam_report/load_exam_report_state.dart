part of 'load_exam_report_cubit.dart';

const _selectedSubjectsNoChange = Object();

class LoadExamReportState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamReportEntity> allReports;
  final List<ExamReportEntity> reports;
  final List<String> availableSubjects;
  final List<String> selectedSubjects;
  final String? error;

  const LoadExamReportState({
    this.loadingState = AppLoadingState.initial,
    this.allReports = const [],
    this.reports = const [],
    this.availableSubjects = const [],
    this.selectedSubjects = const [],
    this.error,
  });

  LoadExamReportState copyWith({
    AppLoadingState? loadingState,
    List<ExamReportEntity>? allReports,
    List<ExamReportEntity>? reports,
    List<String>? availableSubjects,
    Object? selectedSubjects = _selectedSubjectsNoChange,
    String? error,
  }) {
    return LoadExamReportState(
      loadingState: loadingState ?? this.loadingState,
      allReports: allReports ?? this.allReports,
      reports: reports ?? this.reports,
      availableSubjects: availableSubjects ?? this.availableSubjects,
      selectedSubjects: selectedSubjects == _selectedSubjectsNoChange
          ? this.selectedSubjects
          : List<String>.from(selectedSubjects as List),
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    loadingState,
    allReports,
    reports,
    availableSubjects,
    selectedSubjects,
    error,
  ];
}
