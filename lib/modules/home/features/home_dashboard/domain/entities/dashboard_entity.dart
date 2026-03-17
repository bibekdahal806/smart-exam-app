class DashboardEntity {
  final DashboardSummaryEntity summary;
  final PerformanceOvertimeEntity performanceOvertime;
  final List<SubjectwiseStrengthEntity> subjectwiseStrength;

  const DashboardEntity({
    required this.summary,
    required this.performanceOvertime,
    required this.subjectwiseStrength,
  });
}

class DashboardSummaryEntity {
  final int overallScore;
  final int attemptedExams;
  final int passedExams;
  final int failedExams;

  const DashboardSummaryEntity({
    required this.overallScore,
    required this.attemptedExams,
    required this.passedExams,
    required this.failedExams,
  });
}

class PerformanceOvertimeEntity {
  final String range;
  final List<ChartPointEntity> chartPoints;

  const PerformanceOvertimeEntity({
    required this.range,
    required this.chartPoints,
  });
}

class ChartPointEntity {
  final String label;
  final double studentScore;
  final double averageStudentScore;

  const ChartPointEntity({
    required this.label,
    required this.studentScore,
    required this.averageStudentScore,
  });
}

class SubjectwiseStrengthEntity {
  final int subjectId;
  final String subjectName;
  final int examAttempted;
  final double averageScore;

  const SubjectwiseStrengthEntity({
    required this.subjectId,
    required this.subjectName,
    required this.examAttempted,
    required this.averageScore,
  });
}
