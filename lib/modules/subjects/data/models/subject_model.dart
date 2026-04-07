import 'dart:convert';

class SubjectModel {
  final String? id;
  final String? name;
  final int? examCount;
  final int? attemptedExamCount;

  SubjectModel({this.id, this.name, this.examCount, this.attemptedExamCount});

  SubjectModel copyWith({
    String? id,
    String? name,
    int? examCount,
    int? attemptedExamCount,
  }) => SubjectModel(
    id: id ?? this.id,
    name: name ?? this.name,
    examCount: examCount ?? this.examCount,
    attemptedExamCount: attemptedExamCount ?? this.attemptedExamCount,
  );

  factory SubjectModel.fromRawJson(String str) =>
      SubjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json["id"],
    name: json["name"],
    examCount: json["exam_count"] == null
        ? null
        : int.tryParse(json["exam_count"].toString()),
    attemptedExamCount: json["attempted_exam_count"] == null
        ? null
        : int.tryParse(json["attempted_exam_count"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "exam_count": examCount,
    "attempted_exam_count": attemptedExamCount,
  };
}
