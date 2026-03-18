import 'dart:convert';

class ExamReportModel {
  final String? id;
  final String? title;
  final String? createdAt;
  final String? startedAt;
  final int? duration;
  final String? submittedAt;
  final num? totalMarks;
  final num? obtainedMarks;
  final List<QuestionReportModel>? questions;

  const ExamReportModel({
    this.id,
    this.title,
    this.createdAt,
    this.startedAt,
    this.duration,
    this.submittedAt,
    this.totalMarks,
    this.obtainedMarks,
    this.questions,
  });

  factory ExamReportModel.fromRawJson(String str) =>
      ExamReportModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ExamReportModel.fromJson(Map<String, dynamic> json) {
    return ExamReportModel(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      createdAt: json['created_at']?.toString(),
      startedAt: json['started_at']?.toString(),
      duration: (json['duration_seconds'] as num?)?.toInt(),
      submittedAt: json['submitted_at']?.toString(),
      totalMarks: json['total_marks'] as num?,
      obtainedMarks: json['obtained_marks'] as num?,
      questions: json['questions'] == null
          ? const []
          : List<QuestionReportModel>.from(
              (json['questions'] as List<dynamic>).map(
                (x) =>
                    QuestionReportModel.fromJson(Map<String, dynamic>.from(x)),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'created_at': createdAt,
    'started_at': startedAt,
    'duration_seconds': duration,
    'submitted_at': submittedAt,
    'total_marks': totalMarks,
    'obtained_marks': obtainedMarks,
    'questions': questions == null
        ? []
        : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class QuestionReportModel {
  final String? id;
  final String? orderId;
  final String? text;
  final String? type;
  final dynamic correctAnswer;
  final dynamic submittedAnswer;
  final num? obtainedMarks;
  final num? fullMarks;

  const QuestionReportModel({
    this.id,
    this.orderId,
    this.text,
    this.type,
    this.correctAnswer,
    this.submittedAnswer,
    this.obtainedMarks,
    this.fullMarks,
  });

  factory QuestionReportModel.fromJson(Map<String, dynamic> json) {
    return QuestionReportModel(
      id: json['id']?.toString(),
      orderId: json['order_id']?.toString(),
      text: json['text']?.toString(),
      type: json['type']?.toString(),
      correctAnswer: json['correct_answer'],
      submittedAnswer: json['submitted_answer'],
      obtainedMarks: json['obtained_marks'] as num?,
      fullMarks: json['full_marks'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'text': text,
    'type': type,
    'correct_answer': correctAnswer,
    'submitted_answer': submittedAnswer,
    'obtained_marks': obtainedMarks,
    'full_marks': fullMarks,
  };
}
