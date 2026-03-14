import 'dart:convert';

import 'package:q_bank/modules/exam/exam.dart';

class ExamModel {
  final String? id;
  final String? createdAt;
  final String? title;
  final String? description;
  final bool? hasTimer;
  final int? durationSeconds;
  final List<QuestionModel>? questions;

  const ExamModel({
    this.id,
    this.createdAt,
    this.title,
    this.description,
    this.hasTimer,
    this.durationSeconds,
    this.questions,
  });

  factory ExamModel.fromRawJson(String str) =>
      ExamModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    id: json['id']?.toString(),

    createdAt: json['created_at']?.toString(),
    title: json['title']?.toString(),
    description: json['description']?.toString(),
    hasTimer: json['has_timer'] as bool?,
    durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
    questions: json['questions'] == null
        ? const []
        : List<QuestionModel>.from(
            (json['questions'] as List<dynamic>).map(
              (x) => QuestionModel.fromJson(x as Map<String, dynamic>),
            ),
          ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'title': title,
    'description': description,
    'has_timer': hasTimer,
    'duration_seconds': durationSeconds,
    'questions': questions == null
        ? []
        : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}
