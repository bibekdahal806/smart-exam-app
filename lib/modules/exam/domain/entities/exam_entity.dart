import 'package:equatable/equatable.dart';
import 'question_entity.dart';

class ExamEntity extends Equatable {
  final String? id;
  final String? createdAt;
  final String? title;
  final String? description;
  final String? accessType;
  final bool isAttempted;
  final bool hasTimer;
  final int? durationSeconds;
  final List<QuestionEntity> questions;

  const ExamEntity({
    this.id,
    this.createdAt,
    this.title,
    this.description,
    this.accessType,
    this.isAttempted = false,
    this.hasTimer = false,
    this.durationSeconds,
    this.questions = const [],
  });

  String? get normalizedAccessType {
    final value = accessType?.trim().toLowerCase();
    if (value == null || value.isEmpty) return null;
    return value;
  }

  bool get isTimed => hasTimer && (durationSeconds ?? 0) > 0;

  @override
  List<Object?> get props => [
    id,
    createdAt,
    title,
    description,
    accessType,
    isAttempted,
    hasTimer,
    durationSeconds,
    questions,
  ];
}
