import 'package:q_bank/modules/exam/exam.dart';

class ExamAnswerUtils {
  static bool isAnswered(QuestionEntity question, List<String> answers) {
    if (answers.isEmpty) return false;
    switch (question.type) {
      case QuestionType.text:
        return answers.first.trim().isNotEmpty;
      case QuestionType.single:
      case QuestionType.multi:
        return answers.any((e) => e.trim().isNotEmpty);
    }
  }

  static List<QuestionResultEntity> normalizeResults({
    required List<QuestionEntity> questions,
    required Map<String, List<String>> answersByQuestionId,
  }) {
    return questions
        .where((q) => (q.id ?? '').trim().isNotEmpty)
        .map(
          (q) => QuestionResultEntity(
            questionId: q.id!.trim(),
            answers: answersByQuestionId[q.id!.trim()] ?? const [],
          ),
        )
        .toList();
  }
}
