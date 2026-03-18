import 'dart:convert';

class DashboardModel {
  final Summary? summary;
  final PerformanceOvertime? performanceOvertime;
  final List<SubjectwiseStrength>? subjectwiseStrength;

  DashboardModel({
    this.summary,
    this.performanceOvertime,
    this.subjectwiseStrength,
  });

  DashboardModel copyWith({
    Summary? summary,
    PerformanceOvertime? performanceOvertime,
    List<SubjectwiseStrength>? subjectwiseStrength,
  }) => DashboardModel(
    summary: summary ?? this.summary,
    performanceOvertime: performanceOvertime ?? this.performanceOvertime,
    subjectwiseStrength: subjectwiseStrength ?? this.subjectwiseStrength,
  );

  factory DashboardModel.fromRawJson(String str) =>
      DashboardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      DashboardModel(
        summary: json["summary"] == null
            ? null
            : Summary.fromJson(json["summary"]),
        performanceOvertime: json["performance_overtime"] == null
            ? null
            : PerformanceOvertime.fromJson(json["performance_overtime"]),
        subjectwiseStrength: json["subjectwise_strength"] == null
            ? []
            : List<SubjectwiseStrength>.from(
                json["subjectwise_strength"]!.map(
                  (x) => SubjectwiseStrength.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "summary": summary?.toJson(),
    "performance_overtime": performanceOvertime?.toJson(),
    "subjectwise_strength": subjectwiseStrength == null
        ? []
        : List<dynamic>.from(subjectwiseStrength!.map((x) => x.toJson())),
  };
}

class PerformanceOvertime {
  final String? range;
  final List<ChartPoint>? chartPoints;

  PerformanceOvertime({this.range, this.chartPoints});

  PerformanceOvertime copyWith({
    String? range,
    List<ChartPoint>? chartPoints,
  }) => PerformanceOvertime(
    range: range ?? this.range,
    chartPoints: chartPoints ?? this.chartPoints,
  );

  factory PerformanceOvertime.fromRawJson(String str) =>
      PerformanceOvertime.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PerformanceOvertime.fromJson(Map<String, dynamic> json) =>
      PerformanceOvertime(
        range: json["range"],
        chartPoints: json["chart_points"] == null
            ? []
            : List<ChartPoint>.from(
                json["chart_points"]!.map((x) => ChartPoint.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "range": range,
    "chart_points": chartPoints == null
        ? []
        : List<dynamic>.from(chartPoints!.map((x) => x.toJson())),
  };
}

class ChartPoint {
  final String? label;
  final int? studentScore;
  final int? averageStudentScore;

  ChartPoint({this.label, this.studentScore, this.averageStudentScore});

  ChartPoint copyWith({
    String? label,
    int? studentScore,
    int? averageStudentScore,
  }) => ChartPoint(
    label: label ?? this.label,
    studentScore: studentScore ?? this.studentScore,
    averageStudentScore: averageStudentScore ?? this.averageStudentScore,
  );

  factory ChartPoint.fromRawJson(String str) =>
      ChartPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChartPoint.fromJson(Map<String, dynamic> json) => ChartPoint(
    label: json["label"],
    studentScore: json["student_score"],
    averageStudentScore: json["average_student_score"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "student_score": studentScore,
    "average_student_score": averageStudentScore,
  };
}

class SubjectwiseStrength {
  final int? subjectId;
  final String? subjectName;
  final int? examAttempted;
  final int? averageScore;

  SubjectwiseStrength({
    this.subjectId,
    this.subjectName,
    this.examAttempted,
    this.averageScore,
  });

  SubjectwiseStrength copyWith({
    int? subjectId,
    String? subjectName,
    int? examAttempted,
    int? averageScore,
  }) => SubjectwiseStrength(
    subjectId: subjectId ?? this.subjectId,
    subjectName: subjectName ?? this.subjectName,
    examAttempted: examAttempted ?? this.examAttempted,
    averageScore: averageScore ?? this.averageScore,
  );

  factory SubjectwiseStrength.fromRawJson(String str) =>
      SubjectwiseStrength.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectwiseStrength.fromJson(Map<String, dynamic> json) =>
      SubjectwiseStrength(
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        examAttempted: json["exam_attempted"],
        averageScore: json["average_score"],
      );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "subject_name": subjectName,
    "exam_attempted": examAttempted,
    "average_score": averageScore,
  };
}

class Summary {
  final int? overallScore;
  final int? attemptedExams;
  final int? passedExams;
  final int? failedExams;

  Summary({
    this.overallScore,
    this.attemptedExams,
    this.passedExams,
    this.failedExams,
  });

  Summary copyWith({
    int? overallScore,
    int? attemptedExams,
    int? passedExams,
    int? failedExams,
  }) => Summary(
    overallScore: overallScore ?? this.overallScore,
    attemptedExams: attemptedExams ?? this.attemptedExams,
    passedExams: passedExams ?? this.passedExams,
    failedExams: failedExams ?? this.failedExams,
  );

  factory Summary.fromRawJson(String str) => Summary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    overallScore: json["overall_score"],
    attemptedExams: json["attempted_exams"],
    passedExams: json["passed_exams"],
    failedExams: json["failed_exams"],
  );

  Map<String, dynamic> toJson() => {
    "overall_score": overallScore,
    "attempted_exams": attemptedExams,
    "passed_exams": passedExams,
    "failed_exams": failedExams,
  };
}
