import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportEntity extends Equatable {
  final String? id;
  final String? title;
  final String? createdAt;
  final String? startedAt;
  final int? duration;
  final String? submittedAt;
  final num? totalMarks;
  final num? obtainedMarks;

  final List<QuestionReportEntity> questions;

  const ExamReportEntity({
    this.id,
    this.title,
    this.createdAt,
    this.startedAt,
    this.duration,
    this.submittedAt,
    this.totalMarks,
    this.obtainedMarks,
    this.questions = const [],
  });

  @override
  List<Object?> get props => [
    id,
    title,
    createdAt,
    startedAt,
    duration,
    submittedAt,
    totalMarks,
    obtainedMarks,
    questions,
  ];
}

class QuestionReportEntity extends Equatable {
  final String? id;
  final String? orderId;
  final String? text;
  final QuestionType type;
  final dynamic correctAnswer;
  final dynamic submittedAnswer;
  final num? obtainedMarks;
  final num? fullMarks;

  const QuestionReportEntity({
    this.id,
    this.orderId,
    this.text,
    this.type = QuestionType.text,
    this.correctAnswer,
    this.submittedAnswer,
    this.obtainedMarks,
    this.fullMarks,
  });

  @override
  List<Object?> get props => [
    id,
    orderId,
    text,
    type,
    correctAnswer,
    submittedAnswer,
    obtainedMarks,
    fullMarks,
  ];
}
