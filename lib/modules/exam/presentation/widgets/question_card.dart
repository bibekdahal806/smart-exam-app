import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

class QuestionCard extends StatelessWidget {
  final QuestionEntity question;

  /// Current answers for this question.
  final List<String> value;

  /// Called when answers change.
  final void Function(List<String>) update;

  final FormFieldSetter<List<String>>? onSaved;
  final FormFieldValidator<List<String>>? validator;
  final AutovalidateMode? autovalidateMode;

  final String defaultErrorText;

  const QuestionCard({
    super.key,
    required this.question,
    required this.value,
    required this.update,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    required this.defaultErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return SurveyFormField(
      defaultErrorText: defaultErrorText,
      question: question,
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: autovalidateMode,
      builder: (state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 24,
                    right: 20,
                    left: 20,
                    bottom: 6,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: question.text ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                      // children: question.isMandatory
                      //     ? const [
                      //         TextSpan(
                      //           text: '*',
                      //           style: TextStyle(color: Colors.red),
                      //         ),
                      //       ]
                      //     : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 20,
                    top: 6,
                    bottom: 6,
                  ),
                  child: AnswerChoiceWidget(
                    question: question,
                    value: value,
                    onChange: (v) {
                      state.didChange(v);
                      update(v);
                    },
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      state.errorText ?? defaultErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
