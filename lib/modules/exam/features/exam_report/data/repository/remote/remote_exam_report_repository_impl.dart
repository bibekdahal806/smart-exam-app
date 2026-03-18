import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

@Injectable(as: RemoteExamReportRepository)
class RemoteExamReportRepositoryImpl implements RemoteExamReportRepository {
  RemoteExamReportRepositoryImpl();

  final RemoteService _remoteService = getIt<RemoteService>();

  @override
  Future<List<ExamReportEntity>> getExamReports() async {
    final response = await _remoteService.getResponse(
      endPoint: ApiRoutes.examReportsEndPoint,
      isTokenRequired: true,
    );

    final data = response?['data'];

    if (data == null) {
      return [];
    }

    final reportJson = data is List
        ? data
        : data['reports'] is List
        ? data['reports'] as List
        : <dynamic>[];

    return reportJson
        .map(
          (e) => ExamReportMapper.toEntity(
            ExamReportModel.fromJson(Map<String, dynamic>.from(e)),
          ),
        )
        .toList();
    // return examReportDummyData;
  }
}
