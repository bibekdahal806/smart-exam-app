import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

/// Base FormField wrapper for a question.
class SurveyFormField extends StatelessWidget {
  final QuestionEntity question;

  final FormFieldSetter<List<String>>? onSaved;
  final FormFieldValidator<List<String>>? validator;
  final AutovalidateMode? autovalidateMode;

  /// Default error text if question.isMandatory == true and answer is empty.
  final String defaultErrorText;

  final Widget Function(FormFieldState<List<String>> state) builder;

  const SurveyFormField({
    super.key,
    required this.question,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    required this.builder,
    required this.defaultErrorText,
  });

  // bool _isEmptyAnswer(List<String>? value) {
  //   if (value == null || value.isEmpty) return true;
  //   if (question.type == QuestionType.text) {
  //     return value.first.trim().isEmpty;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      onSaved: onSaved,

      initialValue: const [],
      autovalidateMode: autovalidateMode,
      builder: builder,
    );
  }
}
