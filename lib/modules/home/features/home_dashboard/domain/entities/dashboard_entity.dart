class DashboardEntity {
  final SummaryEntity? summary;
  final PerformanceOvertimeEntity? performanceOvertime;
  final List<SubjectwiseStrengthEntity>? subjectwiseStrength;

  const DashboardEntity({
    this.summary,
    this.performanceOvertime,
    this.subjectwiseStrength,
  });
}

/* ---------------- SUMMARY ---------------- */

class SummaryEntity {
  final int? overallScore;
  final int? attemptedExams;
  final int? passedExams;
  final int? failedExams;

  const SummaryEntity({
    this.overallScore,
    this.attemptedExams,
    this.passedExams,
    this.failedExams,
  });
}

/* ------------ PERFORMANCE OVERTIME ------------ */

class PerformanceOvertimeEntity {
  final String? range;
  final List<ChartPointEntity>? chartPoints;

  const PerformanceOvertimeEntity({this.range, this.chartPoints});
}

/* ---------------- CHART POINT ---------------- */

class ChartPointEntity {
  final String? label;
  final int? studentScore;
  final int? averageStudentScore;

  const ChartPointEntity({
    this.label,
    this.studentScore,
    this.averageStudentScore,
  });
}

/* ----------- SUBJECTWISE STRENGTH ------------ */

class SubjectwiseStrengthEntity {
  final int? subjectId;
  final String? subjectName;
  final int? examAttempted;
  final int? averageScore;

  const SubjectwiseStrengthEntity({
    this.subjectId,
    this.subjectName,
    this.examAttempted,
    this.averageScore,
  });
}
