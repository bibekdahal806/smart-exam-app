import 'package:q_bank/modules/subjects/subjects.dart';

abstract class RemoteSubjectRepository {
  Future<List<SubjectEntity>> getSubjects();

  // Future<> startChat({required String user2Id});
}
