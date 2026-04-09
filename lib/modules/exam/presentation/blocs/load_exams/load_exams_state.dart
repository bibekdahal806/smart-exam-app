part of 'load_exams_cubit.dart';

const _selectedAccessTypeNoChange = Object();

class LoadExamsState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamEntity> allExams;
  final List<ExamEntity> exams;
  final String? selectedAccessType;
  final ExamScreenArgument? argument;
  final String? error;

  const LoadExamsState({
    this.loadingState = AppLoadingState.initial,
    this.allExams = const [],
    this.exams = const [],
    this.selectedAccessType,
    this.argument,
    this.error,
  });

  LoadExamsState copyWith({
    AppLoadingState? loadingState,
    List<ExamEntity>? allExams,
    List<ExamEntity>? exams,
    Object? selectedAccessType = _selectedAccessTypeNoChange,
    ExamScreenArgument? argument,
    String? error,
  }) {
    return LoadExamsState(
      loadingState: loadingState ?? this.loadingState,
      allExams: allExams ?? this.allExams,
      exams: exams ?? this.exams,
      selectedAccessType: selectedAccessType == _selectedAccessTypeNoChange
          ? this.selectedAccessType
          : selectedAccessType as String?,
      argument: argument ?? this.argument,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    loadingState,
    allExams,
    exams,
    selectedAccessType,
    argument,
    error,
  ];
}
