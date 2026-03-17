import 'dart:convert';

import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectMapper {
  static SubjectEntity toEntity(SubjectModel model) {
    return SubjectEntity(
      id: model.id,
      name: model.name,
      examCount: model.examCount,
    );
  }

  static SubjectModel toModel(SubjectEntity entity) {
    return SubjectModel(
      id: entity.id,
      name: entity.name,
      examCount: entity.examCount,
    );
  }

  static SubjectEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(SubjectModel.fromJson(json));
  }

  static SubjectEntity fromRawJsonToEntity(String rawJson) {
    return toEntity(SubjectModel.fromJson(jsonDecode(rawJson)));
  }

  static Map<String, dynamic> toJsonFromEntity(SubjectEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(SubjectEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }

  static List<SubjectEntity> fromJsonListToEntityList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJsonToEntity(json as Map<String, dynamic>))
        .toList();
  }

  static List<SubjectEntity> fromRawJsonListToEntityList(String rawJsonList) {
    final List<dynamic> jsonList = jsonDecode(rawJsonList);
    return fromJsonListToEntityList(jsonList);
  }

  static List<Map<String, dynamic>> toJsonListFromEntityList(
    List<SubjectEntity> entities,
  ) {
    return entities.map((e) => toJsonFromEntity(e)).toList();
  }

  static String toRawJsonListFromEntityList(List<SubjectEntity> entities) {
    return jsonEncode(toJsonListFromEntityList(entities));
  }
}
