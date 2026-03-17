import 'package:q_bank/modules/home/home.dart';

class DashboardResponseModel {
  final bool status;
  final String message;
  final DashboardDataModel data;
  final dynamic errors;

  const DashboardResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) {
    return DashboardResponseModel(
      status: json['status'] == true,
      message: json['message']?.toString() ?? '',
      data: DashboardDataModel.fromJson(
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      errors: json['errors'],
    );
  }
}

class DashboardDataModel {
  final DashboardModel dashboard;

  const DashboardDataModel({required this.dashboard});

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) {
    return DashboardDataModel(
      dashboard: DashboardModel.fromJson(
        json['dashboard'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }
}

class DashboardModel extends DashboardEntity {
  const DashboardModel({
    required super.summary,
    required super.performanceOvertime,
    required super.subjectwiseStrength,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      summary: DashboardSummaryModel.fromJson(
        json['summary'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      performanceOvertime: PerformanceOvertimeModel.fromJson(
        json['performance_overtime'] as Map<String, dynamic>? ??
            <String, dynamic>{},
      ),
      subjectwiseStrength:
          (json['subjectwise_strength'] as List<dynamic>? ?? [])
              .map(
                (e) => SubjectwiseStrengthModel.fromJson(
                  e as Map<String, dynamic>? ?? <String, dynamic>{},
                ),
              )
              .toList(),
    );
  }
}

class DashboardSummaryModel extends DashboardSummaryEntity {
  const DashboardSummaryModel({
    required super.overallScore,
    required super.attemptedExams,
    required super.passedExams,
    required super.failedExams,
  });

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) {
    return DashboardSummaryModel(
      overallScore: (json['overall_score'] ?? 0) as int,
      attemptedExams: (json['attempted_exams'] ?? 0) as int,
      passedExams: (json['passed_exams'] ?? 0) as int,
      failedExams: (json['failed_exams'] ?? 0) as int,
    );
  }
}

class PerformanceOvertimeModel extends PerformanceOvertimeEntity {
  const PerformanceOvertimeModel({
    required super.range,
    required super.chartPoints,
  });

  factory PerformanceOvertimeModel.fromJson(Map<String, dynamic> json) {
    return PerformanceOvertimeModel(
      range: json['range']?.toString() ?? 'weekly',
      chartPoints: (json['chart_points'] as List<dynamic>? ?? [])
          .map(
            (e) => ChartPointModel.fromJson(
              e as Map<String, dynamic>? ?? <String, dynamic>{},
            ),
          )
          .toList(),
    );
  }
}

class ChartPointModel extends ChartPointEntity {
  const ChartPointModel({
    required super.label,
    required super.studentScore,
    required super.averageStudentScore,
  });

  factory ChartPointModel.fromJson(Map<String, dynamic> json) {
    return ChartPointModel(
      label: json['label']?.toString() ?? '',
      studentScore: (json['student_score'] ?? 0).toDouble(),
      averageStudentScore: (json['average_student_score'] ?? 0).toDouble(),
    );
  }
}

class SubjectwiseStrengthModel extends SubjectwiseStrengthEntity {
  const SubjectwiseStrengthModel({
    required super.subjectId,
    required super.subjectName,
    required super.examAttempted,
    required super.averageScore,
  });

  factory SubjectwiseStrengthModel.fromJson(Map<String, dynamic> json) {
    return SubjectwiseStrengthModel(
      subjectId: (json['subject_id'] ?? 0) as int,
      subjectName: json['subject_name']?.toString() ?? '',
      examAttempted: (json['exam_attempted'] ?? 0) as int,
      averageScore: (json['average_score'] ?? 0).toDouble(),
    );
  }
}
