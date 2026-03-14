import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  final int total;
  final QuestionEntity question;
  final List<String> value;
  final void Function(List<String>) onChanged;
  final String defaultErrorText;

  const QuestionCard({
    super.key,
    required this.index,
    required this.total,
    required this.question,
    required this.value,
    required this.onChanged,
    this.defaultErrorText = 'This field is mandatory*',
  });

  @override
  Widget build(BuildContext context) {
    final answered = ExamAnswerUtils.isAnswered(question, value);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${index + 1} of $total',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          question.text ?? '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      if (question.isMandatory)
                        const Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AnswerChoiceWidget(
                    question: question,
                    value: value,
                    onChange: onChanged,
                  ),
                  if (question.isMandatory && !answered)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        question.errorText ?? defaultErrorText,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
