import 'package:q_bank/modules/exam/exam.dart';

extension QuestionTypeX on QuestionType {
  String get value {
    switch (this) {
      case QuestionType.text:
        return 'text';
      case QuestionType.single:
        return 'single';
      case QuestionType.multi:
        return 'multi';
    }
  }

  static QuestionType fromValue(String? value) {
    switch ((value ?? '').toLowerCase()) {
      case 'single':
        return QuestionType.single;
      case 'multi':
        return QuestionType.multi;
      case 'text':
      default:
        return QuestionType.text;
    }
  }
}
