import 'package:q_bank/modules/exam/exam.dart';

class ExamDetailArgument {
  final ExamEntity exam;
  final ExamSessionEntity? session;

  const ExamDetailArgument({required this.exam, this.session});

  factory ExamDetailArgument.fromSession(ExamSessionEntity session) {
    return ExamDetailArgument(exam: session.exam, session: session);
  }
}
