import '../../entities/exam_session_entity.dart';

abstract class LocalExamSessionRepository {
  Future<void> saveSession(ExamSessionEntity session);
  Future<ExamSessionEntity?> getSession(String examId);
  Future<List<ExamSessionEntity>> getPendingSessions();
  Future<void> deleteSession(String examId);
  Future<void> clearAllSessions();
  Stream<List<ExamSessionEntity>> watchPendingSessions();
}
