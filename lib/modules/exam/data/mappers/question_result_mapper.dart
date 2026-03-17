import 'package:q_bank/modules/exam/exam.dart';

class QuestionResultMapper {
  static QuestionResultEntity toEntity(QuestionResultModel model) =>
      QuestionResultEntity(
        questionId: model.questionId,
        answers: model.answers,
      );

  static QuestionResultModel toModel(QuestionResultEntity entity) =>
      QuestionResultModel(
        questionId: entity.questionId,
        answers: entity.answers,
      );

  static List<QuestionResultEntity> toEntityList(
    List<QuestionResultModel>? models,
  ) => models?.map(toEntity).toList() ?? const [];

  static List<QuestionResultModel> toModelList(
    List<QuestionResultEntity>? entities,
  ) => entities?.map(toModel).toList() ?? const [];
}
