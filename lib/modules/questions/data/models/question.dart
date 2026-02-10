import 'package:equatable/equatable.dart';

class Question extends Equatable {
  /// The parameter that contains the data pertaining to a question.
  final String question;

  /// Indicates whether the question is single choice or multiple choice.
  final bool singleChoice;

  /// Possible answer choices and their corresponding follow-up questions.
  final Map<String, List<Question>?> answerChoices;

  /// Whether answering this question is mandatory.
  final bool isMandatory;

  /// Default error text shown upon validation failure.
  final String? errorText;

  /// Custom properties for every question/field.
  final Map<String, dynamic>? properties;

  /// The list of answers selected by the user.
  final List<String> answers;

  Question({
    required this.question,
    this.singleChoice = true,
    Map<String, List<Question>?>? answerChoices,
    this.isMandatory = false,
    this.errorText,
    this.properties,
    List<String>? answers,
  }) : answers = answers ?? const [],
       answerChoices = answerChoices ?? const {},
       assert(
         (properties != null &&
                 (answerChoices == null || answerChoices.isEmpty)) ||
             properties == null,
       );

  /// Manual fromJson
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      singleChoice: json['single_choice'] as bool? ?? true,
      answerChoices:
          (json['answer_choices'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(
              key,
              (value as List<dynamic>?)
                  ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ) ??
          const {},
      isMandatory: json['is_mandatory'] as bool? ?? false,
      errorText: json['error_text'] as String?,
      properties: json['properties'] as Map<String, dynamic>?,
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  /// Manual toJson
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'single_choice': singleChoice,
      'answer_choices': answerChoices.map(
        (key, value) => MapEntry(key, value?.map((e) => e.toJson()).toList()),
      ),
      'is_mandatory': isMandatory,
      'error_text': errorText,
      'properties': properties,
      'answers': answers,
    };
  }

  @override
  List<Object?> get props => [
    question,
    singleChoice,
    answerChoices,
    isMandatory,
  ];
}
