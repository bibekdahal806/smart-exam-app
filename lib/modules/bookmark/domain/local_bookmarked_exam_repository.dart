import 'package:q_bank/modules/exam/exam.dart';

abstract class LocalBookmarkedExamRepository {
  Future<void> bookmarkExam(ExamEntity exam);
  Future<void> removeBookmark(String examId);
  Future<void> toggleBookmark(ExamEntity exam);
  Future<bool> isBookmarked(String examId);
  Future<List<ExamEntity>> getBookmarkedExams();

  Stream<List<ExamEntity>> watchBookmarkedExams();
  Stream<bool> watchIsBookmarked(String examId);
}
