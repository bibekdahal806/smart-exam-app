import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class ExamMapper {
  static ExamEntity toEntity(ExamModel model) {
    final duration = model.durationSeconds;
    final hasTimer = model.hasTimer ?? ((duration ?? 0) > 0);
    return ExamEntity(
      id: model.id,
      createdAt: model.createdAt,
      title: model.title,
      description: model.description,
      isAttempted: model.isAttempted ?? false,
      hasTimer: hasTimer,
      durationSeconds: hasTimer ? duration : null,
      questions: (model.questions ?? const [])
          .map(QuestionMapper.toEntity)
          .toList(),
    );
  }

  static ExamModel toModel(ExamEntity entity) => ExamModel(
    id: entity.id,
    createdAt: entity.createdAt,
    title: entity.title,
    description: entity.description,
    isAttempted: entity.isAttempted,
    hasTimer: entity.hasTimer,
    durationSeconds: entity.durationSeconds,
    questions: entity.questions.map(QuestionMapper.toModel).toList(),
  );

  /// JSON → Entity
  static ExamEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(ExamModel.fromJson(json));
  }

  static ExamEntity fromRawJsonToEntity(String raw) {
    return toEntity(ExamModel.fromRawJson(raw));
  }

  /// Entity → JSON
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
