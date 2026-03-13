import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

@Injectable(as: RemoteExamRepository)
class RemoteExamRepositoryImpl implements RemoteExamRepository {
  final RemoteService _remoteService = getIt<RemoteService>();
  @override
  Future<List<ExamEntity>> getExams() async {
    try {
      var response = await _remoteService.getResponse(
        endPoint: ApiRoutes.loginEndPoint,
      );
      if (response != null) {
        return ExamMapper.fromJsonListToEntityList(response["exams"]);
      } else {
        throw ServerException(Messages.getExamDataFailed);
      }
    } catch (e) {
      rethrow;
    }
  }
}
