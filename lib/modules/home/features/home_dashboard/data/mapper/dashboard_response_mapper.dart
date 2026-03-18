import 'dart:convert';

import '../../domain/entities/dashboard_entity.dart';
import '../models/dashboard_response_model.dart';

class DashboardMapper {
  /* =====================================================
      DashboardResponse
  ===================================================== */

  static DashboardEntity toEntity(DashboardModel model) {
    return DashboardEntity(
      summary: model.summary == null ? null : _summaryToEntity(model.summary!),
      performanceOvertime: model.performanceOvertime == null
          ? null
          : _performanceToEntity(model.performanceOvertime!),
      subjectwiseStrength: model.subjectwiseStrength
          ?.map(_subjectStrengthToEntity)
          .toList(),
    );
  }

  static DashboardModel toModel(DashboardEntity entity) {
    return DashboardModel(
      summary: entity.summary == null ? null : _summaryToModel(entity.summary!),
      performanceOvertime: entity.performanceOvertime == null
          ? null
          : _performanceToModel(entity.performanceOvertime!),
      subjectwiseStrength: entity.subjectwiseStrength
          ?.map(_subjectStrengthToModel)
          .toList(),
    );
  }

  /* =====================================================
      Summary
  ===================================================== */

  static SummaryEntity _summaryToEntity(Summary model) {
    return SummaryEntity(
      overallScore: model.overallScore,
      attemptedExams: model.attemptedExams,
      passedExams: model.passedExams,
      failedExams: model.failedExams,
    );
  }

  static Summary _summaryToModel(SummaryEntity entity) {
    return Summary(
      overallScore: entity.overallScore,
      attemptedExams: entity.attemptedExams,
      passedExams: entity.passedExams,
      failedExams: entity.failedExams,
    );
  }

  /* =====================================================
      PerformanceOvertime
  ===================================================== */

  static PerformanceOvertimeEntity _performanceToEntity(
    PerformanceOvertime model,
  ) {
    return PerformanceOvertimeEntity(
      range: model.range,
      chartPoints: model.chartPoints?.map(_chartPointToEntity).toList(),
    );
  }

  static PerformanceOvertime _performanceToModel(
    PerformanceOvertimeEntity entity,
  ) {
    return PerformanceOvertime(
      range: entity.range,
      chartPoints: entity.chartPoints?.map(_chartPointToModel).toList(),
    );
  }

  /* =====================================================
      ChartPoint
  ===================================================== */

  static ChartPointEntity _chartPointToEntity(ChartPoint model) {
    return ChartPointEntity(
      label: model.label,
      studentScore: model.studentScore,
      averageStudentScore: model.averageStudentScore,
    );
  }

  static ChartPoint _chartPointToModel(ChartPointEntity entity) {
    return ChartPoint(
      label: entity.label,
      studentScore: entity.studentScore,
      averageStudentScore: entity.averageStudentScore,
    );
  }

  /* =====================================================
      SubjectwiseStrength
  ===================================================== */

  static SubjectwiseStrengthEntity _subjectStrengthToEntity(
    SubjectwiseStrength model,
  ) {
    return SubjectwiseStrengthEntity(
      subjectId: model.subjectId,
      subjectName: model.subjectName,
      examAttempted: model.examAttempted,
      averageScore: model.averageScore,
    );
  }

  static SubjectwiseStrength _subjectStrengthToModel(
    SubjectwiseStrengthEntity entity,
  ) {
    return SubjectwiseStrength(
      subjectId: entity.subjectId,
      subjectName: entity.subjectName,
      examAttempted: entity.examAttempted,
      averageScore: entity.averageScore,
    );
  }

  static DashboardEntity fromJsonToEntity(Map<String, dynamic> json) {
    return toEntity(DashboardModel.fromJson(json));
  }

  static DashboardEntity fromRawJsonToEntity(String raw) {
    return toEntity(DashboardModel.fromRawJson(raw));
  }

  static Map<String, dynamic> toJsonFromEntity(DashboardEntity entity) {
    return toModel(entity).toJson();
  }

  static String toRawJsonFromEntity(DashboardEntity entity) {
    return jsonEncode(toModel(entity).toJson());
  }
}
