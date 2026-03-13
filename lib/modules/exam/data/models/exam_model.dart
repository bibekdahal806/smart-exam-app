import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class ExamModel {
  final String? id;
  final String? createdAt;
  final List<QuestionModel>? questions;
  final bool? hasTimer;
  final int? durationSeconds;

  const ExamModel({
    this.id,
    this.createdAt,
    this.questions,
    this.hasTimer,
    this.durationSeconds,
  });

  factory ExamModel.fromRawJson(String str) =>
      ExamModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    id: json['id'],
    createdAt: json['created_at'] ?? json['createdAt'],
    questions: json['questions'] == null
        ? []
        : List<QuestionModel>.from(
            (json['questions'] as List).map((x) => QuestionModel.fromJson(x)),
          ),
    hasTimer: json['has_timer'],
    durationSeconds: json['duration_seconds'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'questions': questions == null
        ? []
        : List<dynamic>.from(questions!.map((x) => x.toJson())),
    'has_timer': hasTimer,
    'duration_seconds': durationSeconds,
  };
}
