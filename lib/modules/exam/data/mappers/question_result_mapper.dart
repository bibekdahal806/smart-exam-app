import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class QuestionResultMapper {
  static QuestionResultEntity toEntity(QuestionResultModel model) {
    return QuestionResultEntity(
      questionId: model.questionId,
      answers: model.answers,
    );
  }

  static QuestionResultModel toModel(QuestionResultEntity entity) {
    return QuestionResultModel(
      questionId: entity.questionId,
      answers: entity.answers,
    );
  }

  static QuestionResultEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(QuestionResultModel.fromJson(json));
  }

  static Map<String, dynamic> toJsonFromEntity(QuestionResultEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(QuestionResultEntity entity) {
    return jsonEncode(toJsonFromEntity(entity));
  }

  static List<QuestionResultEntity> fromJsonListToEntityList(
    List<dynamic> list,
  ) {
    return list
        .map((e) => fromJsonToEntity(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonListFromEntityList(
    List<QuestionResultEntity> list,
  ) {
    return list.map(toJsonFromEntity).toList();
  }
}
