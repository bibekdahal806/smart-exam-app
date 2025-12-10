import 'package:q_bank/core/core.dart';

extension GenderExtension on Gender {
  String get value {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      case Gender.other:
        return "Other";
    }
  }

  // String get valueLocalized {
  //   switch (this) {
  //     case Gender.male:
  //       return Words.male;
  //     case Gender.female:
  //       return Words.female;
  //     case Gender.other:
  //       return Words.other;
  //   }
  // }

  static Gender fromGenderCode(String value) {
    switch (value.toLowerCase()) {
      case "m":
        return Gender.male;
      case 'f':
        return Gender.female;
      case 'o':
        return Gender.other;
      default:
        throw ParseException("Error parsing value");
    }
  }

  String get toGenderCode {
    switch (this) {
      case Gender.male:
        return "m";
      case Gender.female:
        return "f";
      case Gender.other:
        return "o";
    }
  }
}
