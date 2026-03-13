import 'package:equatable/equatable.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamEntity extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final List<QuestionEntity> questions;

  final bool hasTimer;
  final int? durationSeconds;

  const ExamEntity({
    this.id,
    this.createdAt,
    this.questions = const [],
    this.hasTimer = false,
    this.durationSeconds,
  });

  @override
  List<Object?> get props => [
    id,
    createdAt,
    questions,
    hasTimer,
    durationSeconds,
  ];
}
