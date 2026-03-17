import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

@Injectable(as: RemoteSubjectRepository)
class RemoteSubjectRepositoryImpl implements RemoteSubjectRepository {
  RemoteSubjectRepositoryImpl();

  final RemoteService _remoteService = getIt<RemoteService>();

  @override
  Future<List<SubjectEntity>> getSubjects() async {
    final response = await _remoteService.getResponse(
      endPoint: ApiRoutes.subjectsEndPoint,
      isTokenRequired: true,
    );

    final data = response?['data'];

    if (data == null) {
      return [];
    }

    final subjectsJson = data is List
        ? data
        : data['subjects'] is List
        ? data['subjects'] as List
        : <dynamic>[];

    return subjectsJson
        .map(
          (e) => SubjectMapper.toEntity(
            SubjectModel.fromJson(Map<String, dynamic>.from(e)),
          ),
        )
        .toList();

    // return subjectDummyData;
  }
}
