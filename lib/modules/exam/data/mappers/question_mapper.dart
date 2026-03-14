import 'package:q_bank/modules/exam/exam.dart';

class OptionMapper {
  static OptionEntity toEntity(OptionModel model) =>
      OptionEntity(id: model.id, text: model.text, imageUrl: model.imageUrl);

  static OptionModel toModel(OptionEntity entity) =>
      OptionModel(id: entity.id, text: entity.text, imageUrl: entity.imageUrl);

  static List<OptionEntity> toEntityList(List<OptionModel>? models) =>
      models?.map(toEntity).toList() ?? const [];

  static List<OptionModel> toModelList(List<OptionEntity>? entities) =>
      entities?.map(toModel).toList() ?? const [];
}

class QuestionMapper {
  static QuestionEntity toEntity(QuestionModel model) {
    return QuestionEntity(
      id: model.id,
      orderId: model.orderId,
      text: model.text,
      type: QuestionTypeX.fromValue(model.type),
      options: OptionMapper.toEntityList(model.options),
      isMandatory: model.isMandatory ?? false,
      errorText: model.errorText,
    );
  }

  static QuestionModel toModel(QuestionEntity entity) {
    return QuestionModel(
      id: entity.id,
      orderId: entity.orderId,
      text: entity.text,
      type: entity.type.value,
      options: OptionMapper.toModelList(entity.options),
      isMandatory: entity.isMandatory,
      errorText: entity.errorText,
    );
  }
}
