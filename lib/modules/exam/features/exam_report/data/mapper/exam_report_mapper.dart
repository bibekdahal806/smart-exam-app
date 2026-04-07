import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class ExamReportMapper {
  static ExamReportEntity toEntity(ExamReportModel model) {
    return ExamReportEntity(
      id: model.id,
      title: model.title,
      subjectName: model.subjectName,
      createdAt: model.createdAt,
      startedAt: model.startedAt,
      duration: model.duration,
      submittedAt: model.submittedAt,
      totalMarks: model.totalMarks,
      obtainedMarks: model.obtainedMarks,
      questions: (model.questions ?? const [])
          .map(
            (e) => QuestionReportEntity(
              id: e.id,
              orderId: e.orderId,
              text: e.text,
              type: QuestionTypeX.fromValue(e.type),
              correctAnswer: e.correctAnswer,
              submittedAnswer: e.submittedAnswer,
              obtainedMarks: e.obtainedMarks,
              fullMarks: e.fullMarks,
            ),
          )
          .toList(),
    );
  }

  static ExamReportModel toModel(ExamReportEntity entity) {
    return ExamReportModel(
      id: entity.id,
      title: entity.title,
      subjectName: entity.subjectName,
      createdAt: entity.createdAt,
      startedAt: entity.startedAt,
      duration: entity.duration,
      submittedAt: entity.submittedAt,
      totalMarks: entity.totalMarks,
      obtainedMarks: entity.obtainedMarks,
      questions: entity.questions
          .map(
            (e) => QuestionReportModel(
              id: e.id,
              orderId: e.orderId,
              text: e.text,
              type: e.type.value,
              correctAnswer: e.correctAnswer,
              submittedAnswer: e.submittedAnswer,
              obtainedMarks: e.obtainedMarks,
              fullMarks: e.fullMarks,
            ),
          )
          .toList(),
    );
  }

  static ExamReportEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(ExamReportModel.fromJson(json));
  }

  static ExamReportEntity fromRawJsonToEntity(String raw) {
    return toEntity(ExamReportModel.fromRawJson(raw));
  }

  static Map<String, dynamic> toJsonFromEntity(ExamReportEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(ExamReportEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }

  /// Convert JSON List to [List<ExamReportEntity>]
  static List<ExamReportEntity> fromJsonListToEntityList(
    List<dynamic> jsonList,
  ) {
    return jsonList.map((json) => fromJsonToEntity(json)).toList();
  }

  /// Convert raw JSON string to [List<ExamReportEntity>]
  static List<ExamReportEntity> fromRawJsonListToEntityList(
    String rawJsonList,
  ) {
    final List<dynamic> jsonList = jsonDecode(rawJsonList);
    return fromJsonListToEntityList(jsonList);
  }

  /// Convert [List<ExamReportEntity>] to JSON List
  static List<Map<String, dynamic>> toJsonListFromEntityList(
    List<ExamReportEntity> entities,
  ) {
    return entities.map((entity) => toJsonFromEntity(entity)).toList();
  }

  /// Convert [List<ExamReportEntity>] to raw JSON string
  static String toRawJsonListFromEntityList(List<ExamReportEntity> entities) {
    return jsonEncode(toJsonListFromEntityList(entities));
  }
}
