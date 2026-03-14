import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

@Injectable(as: RemoteExamRepository)
class RemoteExamRepositoryImpl implements RemoteExamRepository {
  RemoteExamRepositoryImpl();

  final RemoteService _remoteService = getIt<RemoteService>();

  @override
  Future<List<ExamEntity>> getExams() async {
    // final response = await _remoteService.getResponse(
    //   endPoint: ApiRoutes.examsEndPoint,
    //   isTokenRequired: true,
    // );

    // final data = response?['data'];

    // if (data == null) {
    //   return [];
    // }

    // final examsJson = data is List
    //     ? data
    //     : data['exams'] is List
    //     ? data['exams'] as List
    //     : <dynamic>[];

    // return examsJson
    //     .map(
    //       (e) => ExamMapper.toEntity(
    //         ExamModel.fromJson(Map<String, dynamic>.from(e)),
    //       ),
    //     )
    //     .toList();
    return examDummyData;
  }

  @override
  Future<List<ExamEntity>> getExamsBySubjectId(String subjectId) async {
    // final response = await _remoteService.getResponse(
    //   endPoint: '${ApiRoutes.subjectsEndPoint}/$subjectId/exams',
    //   isTokenRequired: true,
    // );

    // final examsJson =
    //     (response?['data']?['exams'] as List?) ??
    //     (response?['data'] as List?) ??
    //     const [];

    // return examsJson
    //     .map(
    //       (e) => ExamMapper.toEntity(
    //         ExamModel.fromJson(Map<String, dynamic>.from(e)),
    //       ),
    //     )
    //     .toList();
    return examDummyData;
  }

  @override
  Future<void> submitExam({
    required String examId,
    required DateTime startedAt,
    required DateTime submittedAt,
    required List<QuestionResultEntity> answers,
    int? durationSeconds,
    bool autoSubmitted = false,
  }) async {
    final payload = {
      'exam_id': examId,
      'started_at': startedAt.toIso8601String(),
      'submitted_at': submittedAt.toIso8601String(),
      'duration_seconds': durationSeconds,
      'auto_submitted': autoSubmitted,
      'answers': answers
          .map((e) => {'question_id': e.questionId, 'answers': e.answers})
          .toList(),
    };

    await _remoteService.postResponse(
      endPoint: ApiRoutes.submitExamEndPoint,
      isTokenRequired: true,
      payloadObj: payload,
    );
  }
}
