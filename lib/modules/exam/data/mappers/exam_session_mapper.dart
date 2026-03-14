import 'package:q_bank/modules/exam/exam.dart';

class ExamSessionMapper {
  static ExamSessionEntity toEntity(ExamSessionModel model) =>
      ExamSessionEntity(
        examId: model.examId,
        exam: ExamMapper.toEntity(model.exam),
        currentIndex: model.currentIndex,
        startedAt: DateTime.parse(model.startedAt),
        updatedAt: DateTime.parse(model.updatedAt),
        expiresAt: model.expiresAt == null
            ? null
            : DateTime.parse(model.expiresAt!),
        isSubmitted: model.isSubmitted,
        submittedAt: model.submittedAt == null
            ? null
            : DateTime.parse(model.submittedAt!),
        results: QuestionResultMapper.toEntityList(model.results),
      );

  static ExamSessionModel toModel(ExamSessionEntity entity) => ExamSessionModel(
    examId: entity.examId,
    exam: ExamMapper.toModel(entity.exam),
    currentIndex: entity.currentIndex,
    startedAt: entity.startedAt.toIso8601String(),
    updatedAt: entity.updatedAt.toIso8601String(),
    expiresAt: entity.expiresAt?.toIso8601String(),
    isSubmitted: entity.isSubmitted,
    submittedAt: entity.submittedAt?.toIso8601String(),
    results: QuestionResultMapper.toModelList(entity.results),
  );
}
