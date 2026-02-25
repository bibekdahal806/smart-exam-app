import 'dart:convert';

import 'package:q_bank/modules/subjects/subjects.dart';

class QuestionMapper {
  static QuestionEntity toEntity(QuestionModel model) {
    return QuestionEntity(
      id: model.id,
      text: model.text,
      type: QuestionTypeX.fromValue(model.type),
      options: OptionMapper.toEntityList(model.options),
    );
  }

  static QuestionModel toModel(QuestionEntity entity) {
    return QuestionModel(
      id: entity.id,
      text: entity.text,
      type: entity.type.value,
      options: OptionMapper.toModelList(entity.options),
    );
  }

  static QuestionEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(QuestionModel.fromJson(json));
  }

  static QuestionEntity fromRawJsonToEntity(String rawJson) {
    return toEntity(QuestionModel.fromJson(jsonDecode(rawJson)));
  }

  static Map<String, dynamic> toJsonFromEntity(QuestionEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(QuestionEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }

  static List<QuestionEntity> fromJsonListToEntityList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJsonToEntity(json as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonListFromEntityList(
    List<QuestionEntity> entities,
  ) {
    return entities.map((e) => toJsonFromEntity(e)).toList();
  }
}

class OptionMapper {
  static OptionEntity toEntity(OptionModel model) {
    return OptionEntity(
      id: model.id,
      text: model.text,
      imageUrl: model.imageUrl,
    );
  }

  static OptionModel toModel(OptionEntity entity) {
    return OptionModel(
      id: entity.id,
      text: entity.text,
      imageUrl: entity.imageUrl,
    );
  }

  static List<OptionEntity> toEntityList(List<OptionModel>? models) {
    return models?.map(toEntity).toList() ?? const [];
  }

  static List<OptionModel> toModelList(List<OptionEntity>? entities) {
    return entities?.map(toModel).toList() ?? const [];
  }
}
