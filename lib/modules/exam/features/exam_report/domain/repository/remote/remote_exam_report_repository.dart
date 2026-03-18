import 'package:q_bank/modules/exam/exam.dart';

abstract class RemoteExamReportRepository {
  Future<List<ExamReportEntity>> getExamReports();
}
