import 'package:equatable/equatable.dart';

/// text -> answers = ["typed value"]
/// single/multi -> answers = ["optionId1", "optionId2", ...]
class QuestionResultEntity extends Equatable {
  final String questionId;
  final List<String> answers;

  const QuestionResultEntity({
    required this.questionId,
    this.answers = const [],
  });

  QuestionResultEntity copyWith({String? questionId, List<String>? answers}) {
    return QuestionResultEntity(
      questionId: questionId ?? this.questionId,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [questionId, answers];
}
