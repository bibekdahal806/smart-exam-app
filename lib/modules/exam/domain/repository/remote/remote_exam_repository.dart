import 'package:q_bank/modules/exam/exam.dart';

abstract class RemoteExamRepository {
  Future<List<ExamEntity>> getExams();
}
