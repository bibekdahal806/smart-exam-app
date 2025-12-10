import 'package:q_bank/core/core.dart';

extension LanguageExtension on LanguageType {
  String get value {
    switch (this) {
      case LanguageType.english:
        return "English";
      case LanguageType.hindi:
        return "Hindi";
      case LanguageType.nepali:
        return "Nepali";
    }
  }

  String get valueLocalized {
    switch (this) {
      case LanguageType.english:
        return "Words.english";
      case LanguageType.hindi:
        return "Words.hindi";
      case LanguageType.nepali:
        return "Words.nepali";
    }
  }

  String get valueNative {
    switch (this) {
      case LanguageType.english:
        return "English";
      case LanguageType.hindi:
        return "हिन्दी";
      case LanguageType.nepali:
        return "नेपाली";
    }
  }

  static LanguageType fromLanguageCode(String value) {
    switch (value.toLowerCase()) {
      case "en":
        return LanguageType.english;
      case 'hi':
        return LanguageType.hindi;
      case 'ne':
        return LanguageType.nepali;
      default:
        throw ParseException("Error parsing value");
    }
  }

  String get toLanguageCode {
    switch (this) {
      case LanguageType.english:
        return "en";
      case LanguageType.hindi:
        return "hi";
      case LanguageType.nepali:
        return "ne";
    }
  }

  String get flagRoute {
    switch (this) {
      case LanguageType.nepali:
        return "AssetRoutes.nepalFlag";
      case LanguageType.hindi:
        return "AssetRoutes.indiaFlag";
      case LanguageType.english:
        return "AssetRoutes.englishFlag";
    }
  }
}
