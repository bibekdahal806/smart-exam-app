import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class ExamMapper {
  static ExamEntity toEntity(ExamModel model) {
    return ExamEntity(
      id: model.id,
      createdAt: model.createdAt == null
          ? null
          : DateTime.tryParse(model.createdAt!),
      questions: (model.questions ?? const [])
          .map((q) => QuestionMapper.toEntity(q))
          .toList(),
    );
  }

  static ExamModel toModel(ExamEntity entity) {
    return ExamModel(
      id: entity.id,
      createdAt: entity.createdAt?.toIso8601String(),
      questions: entity.questions
          .map((q) => QuestionMapper.toModel(q))
          .toList(),
    );
  }

  static ExamEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(ExamModel.fromJson(json));
  }

  static ExamEntity fromRawJsonToEntity(String rawJson) {
    return toEntity(ExamModel.fromJson(jsonDecode(rawJson)));
  }

  static Map<String, dynamic> toJsonFromEntity(ExamEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(ExamEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }

  /// Convert JSON List to [List<ExamEntity>]
  static List<ExamEntity> fromJsonListToEntityList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJsonToEntity(json)).toList();
  }

  /// Convert raw JSON string to [List<ExamEntity>]
  static List<ExamEntity> fromRawJsonListToEntityList(String rawJsonList) {
    final List<dynamic> jsonList = jsonDecode(rawJsonList);
    return fromJsonListToEntityList(jsonList);
  }

  /// Convert [List<ExamEntity>] to JSON List
  static List<Map<String, dynamic>> toJsonListFromEntityList(
    List<ExamEntity> entities,
  ) {
    return entities.map((entity) => toJsonFromEntity(entity)).toList();
  }

  /// Convert [List<ExamEntity>] to raw JSON string
  static String toRawJsonListFromEntityList(List<ExamEntity> entities) {
    return jsonEncode(toJsonListFromEntityList(entities));
  }
}
