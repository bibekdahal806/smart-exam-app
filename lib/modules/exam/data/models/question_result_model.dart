import 'package:equatable/equatable.dart';

class QuestionResultModel extends Equatable {
  final String questionId;
  final List<String> answers;

  const QuestionResultModel({
    required this.questionId,
    this.answers = const [],
  });

  factory QuestionResultModel.fromJson(Map<String, dynamic> json) {
    return QuestionResultModel(
      questionId: json['question_id'] as String,
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'question_id': questionId,
    'answers': answers,
  };

  @override
  List<Object?> get props => [questionId, answers];
}
