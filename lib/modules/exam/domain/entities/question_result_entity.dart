import 'package:equatable/equatable.dart';

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
