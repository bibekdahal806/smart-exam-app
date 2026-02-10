import 'package:equatable/equatable.dart';

class QuestionResult extends Equatable {
  /// The parameter that contains the data pertaining to a question.
  final String question;

  /// The list of questions that followed after a particular answer.
  final List<QuestionResult> children;

  /// The list of answers selected by the user.
  final List<String> answers;

  const QuestionResult({
    required this.question,
    this.answers = const [],
    this.children = const [],
  });

  /// Manual fromJson
  factory QuestionResult.fromJson(Map<String, dynamic> json) {
    return QuestionResult(
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => QuestionResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  /// Manual toJson
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers,
      'children': children.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [question, answers, children];
}
