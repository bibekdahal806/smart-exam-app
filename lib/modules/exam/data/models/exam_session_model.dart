import 'package:q_bank/modules/exam/exam.dart';

class ExamSessionModel {
  final String examId;
  final ExamModel exam;
  final int currentIndex;
  final String startedAt;
  final String updatedAt;
  final String? expiresAt;
  final bool isSubmitted;
  final String? submittedAt;
  final List<QuestionResultModel> results;

  const ExamSessionModel({
    required this.examId,
    required this.exam,
    required this.currentIndex,
    required this.startedAt,
    required this.updatedAt,
    this.expiresAt,
    required this.isSubmitted,
    this.submittedAt,
    this.results = const [],
  });

  factory ExamSessionModel.fromJson(Map<String, dynamic> json) =>
      ExamSessionModel(
        examId: json['exam_id'].toString(),
        exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>? ?? {}),
        currentIndex: (json['current_index'] as num? ?? 0).toInt(),
        startedAt: json['started_at'].toString(),
        updatedAt: json['updated_at'].toString(),
        expiresAt: json['expires_at']?.toString(),
        isSubmitted: json['is_submitted'] as bool? ?? false,
        submittedAt: json['submitted_at']?.toString(),
        results: (json['results'] as List<dynamic>? ?? const <dynamic>[])
            .map((e) => QuestionResultModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'exam_id': examId,
    'exam': exam.toJson(),
    'current_index': currentIndex,
    'started_at': startedAt,
    'updated_at': updatedAt,
    'expires_at': expiresAt,
    'is_submitted': isSubmitted,
    'submitted_at': submittedAt,
    'results': results.map((e) => e.toJson()).toList(),
  };
}
