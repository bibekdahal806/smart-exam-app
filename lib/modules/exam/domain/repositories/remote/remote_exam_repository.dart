import 'package:q_bank/modules/exam/exam.dart';

abstract class RemoteExamRepository {
  Future<List<ExamEntity>> getExams();
  Future<List<ExamEntity>> getExamsBySubjectId(String subjectId);

  Future<void> submitExam({
    required String examId,
    required DateTime startedAt,
    required DateTime submittedAt,
    required List<QuestionResultEntity> answers,
    int? durationSeconds,
    bool autoSubmitted = false,
  });
}
