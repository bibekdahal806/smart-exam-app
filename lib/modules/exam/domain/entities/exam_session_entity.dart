import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamSessionEntity extends Equatable {
  final String examId;
  final ExamEntity exam;
  final int currentIndex;
  final DateTime startedAt;
  final DateTime updatedAt;
  final DateTime? expiresAt;
  final bool isSubmitted;
  final DateTime? submittedAt;
  final List<QuestionResultEntity> results;

  const ExamSessionEntity({
    required this.examId,
    required this.exam,
    this.currentIndex = 0,
    required this.startedAt,
    required this.updatedAt,
    this.expiresAt,
    this.isSubmitted = false,
    this.submittedAt,
    this.results = const [],
  });

  bool get isTimed => expiresAt != null;

  int remainingSecondsAt(DateTime now) {
    if (expiresAt == null) {
      return -1;
    }
    final seconds = expiresAt!.difference(now).inSeconds;
    return seconds < 0 ? 0 : seconds;
  }

  ExamSessionEntity copyWith({
    ExamEntity? exam,
    int? currentIndex,
    DateTime? startedAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
    bool? isSubmitted,
    DateTime? submittedAt,
    List<QuestionResultEntity>? results,
  }) {
    return ExamSessionEntity(
      examId: examId,
      exam: exam ?? this.exam,
      currentIndex: currentIndex ?? this.currentIndex,
      startedAt: startedAt ?? this.startedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      submittedAt: submittedAt ?? this.submittedAt,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [
    examId,
    exam,
    currentIndex,
    startedAt,
    updatedAt,
    expiresAt,
    isSubmitted,
    submittedAt,
    results,
  ];
}
