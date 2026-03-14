class QuestionResultModel {
  final String questionId;
  final List<String> answers;

  const QuestionResultModel({required this.questionId, this.answers = const []});

  factory QuestionResultModel.fromJson(Map<String, dynamic> json) {
    return QuestionResultModel(
      questionId: json['question_id'].toString(),
      answers: (json['answers'] as List<dynamic>? ?? const <dynamic>[])
          .map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'question_id': questionId,
        'answers': answers,
      };
}
