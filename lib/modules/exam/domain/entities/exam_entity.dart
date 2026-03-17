import 'package:equatable/equatable.dart';
import 'question_entity.dart';

class ExamEntity extends Equatable {
  final String? id;
  final String? createdAt;
  final String? title;
  final String? description;
  final bool hasTimer;
  final int? durationSeconds;
  final List<QuestionEntity> questions;

  const ExamEntity({
    this.id,
    this.createdAt,
    this.title,
    this.description,
    this.hasTimer = false,
    this.durationSeconds,
    this.questions = const [],
  });

  bool get isTimed => hasTimer && (durationSeconds ?? 0) > 0;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        title,
        description,
        hasTimer,
        durationSeconds,
        questions,
      ];
}
