import 'package:q_bank/modules/exam/exam.dart';

extension QuestionTypeX on QuestionType {
  String get value {
    switch (this) {
      case QuestionType.text:
        return 'open_ended';
      case QuestionType.single:
        return 'mcq';
      case QuestionType.multi:
        return 'multi';
    }
  }

  String get name {
    switch (this) {
      case QuestionType.text:
        return 'Open Ended';
      case QuestionType.single:
        return 'Mcq';
      case QuestionType.multi:
        return 'Multi';
    }
  }

  static QuestionType fromValue(String? value) {
    switch ((value ?? '').toLowerCase()) {
      case 'mcq':
        return QuestionType.single;
      case 'multi':
        return QuestionType.multi;
      case 'open_ended':
      default:
        return QuestionType.text;
    }
  }
}
