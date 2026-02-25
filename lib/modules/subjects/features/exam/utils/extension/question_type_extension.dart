import 'package:q_bank/modules/subjects/subjects.dart';

extension QuestionTypeX on QuestionType {
  String get value {
    switch (this) {
      case QuestionType.text:
        return "text";
      case QuestionType.single:
        return "single";
      case QuestionType.multi:
        return "multi";
    }
  }

  String get displayValue {
    switch (this) {
      case QuestionType.text:
        return "Text";
      case QuestionType.single:
        return "Single";
      case QuestionType.multi:
        return "Multi";
    }
  }

  static QuestionType fromValue(String? value) {
    switch ((value ?? "").toLowerCase()) {
      case "text":
        return QuestionType.text;
      case "single":
        return QuestionType.single;
      case "multi":
        return QuestionType.multi;
      default:
        return QuestionType.text;
    }
  }
}
