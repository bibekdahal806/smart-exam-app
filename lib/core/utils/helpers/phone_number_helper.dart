import 'package:country_picker/country_picker.dart';

class PhoneNumberHelper {
  /// Extracts the country code from a formatted phone number like `+977-9867743236`
  /// +977
  static String? extractCountryCode(String phoneNumber) {
    final parts = phoneNumber.trim().split('-');
    if (parts.isNotEmpty && parts[0].startsWith('+')) {
      return parts[0];
    }
    return null;
  }

  /// Extracts the national number from a formatted phone number like `+977-9867743236`
  /// 9867743236
  static String? extractOnlyContactNumber(String phoneNumber) {
    final parts = phoneNumber.trim().split('-');
    if (parts.length >= 2) {
      return parts[1];
    }
    return null;
  }

  /// Returns the matching Country from the given formatted phone number
  static Country? getCountryFromPhoneNumber(String phoneNumber) {
    final countryCode = extractCountryCode(phoneNumber);
    if (countryCode == null) return null;

    return CountryService().findByPhoneCode(countryCode.substring(1));
  }
}
