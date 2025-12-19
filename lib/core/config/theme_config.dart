// //Theme configuration parameters that can be adjusted based on environment or user settings.
// import 'package:flutter/material.dart';
// import 'package:q_bank/common/common.dart';
// import 'package:q_bank/core/core.dart';

// class ThemeConfigs {
//   static ThemeData lightTheme({String locale = 'en'}) {
//     return ThemeData(
//       fontFamily: locale.toLowerCase() == 'ne' || locale.toLowerCase() == 'hi'
//           ? AppConstants.devnagariFont
//           : AppConstants.englishFont,
//       extensions: const [CustomThemeExtension.lightMode],
//       textTheme: TextTheme(
//         displayLarge: AppTextStyle.displayLarge.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         displayMedium: AppTextStyle.displayMedium.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         displaySmall: AppTextStyle.displaySmall.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         headlineLarge: AppTextStyle.headlineLarge.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         headlineMedium: AppTextStyle.headlineMedium.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         headlineSmall: AppTextStyle.headlineSmall.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         titleLarge: AppTextStyle.titleLarge.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         titleMedium: AppTextStyle.titleMedium.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         titleSmall: AppTextStyle.titleSmall.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         bodyLarge: AppTextStyle.bodyLarge.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         bodyMedium: AppTextStyle.bodyMedium.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         bodySmall: AppTextStyle.bodySmall.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         labelLarge: AppTextStyle.button.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         labelMedium: AppTextStyle.caption.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//         labelSmall: AppTextStyle.underline.copyWith(
//           color: CustomThemeExtension.lightMode.textPrimary,
//         ),
//       ),
//       checkboxTheme: CheckboxThemeData(
//         fillColor: WidgetStateProperty.resolveWith<Color>((
//           Set<WidgetState> states,
//         ) {
//           if (states.isSelected) {
//             return CustomThemeExtension.lightMode.textSecondary;
//           }
//           return CustomThemeExtension.lightMode.backgroundPrimary;
//         }),
//         checkColor: WidgetStateProperty.resolveWith<Color>((
//           Set<WidgetState> states,
//         ) {
//           return CustomThemeExtension.lightMode.backgroundPrimary;
//         }),
//         side: BorderSide(
//           color: CustomThemeExtension.lightMode.border,
//           width: 1.r,
//         ),
//       ),
//       navigationBarTheme: NavigationBarThemeData(
//         backgroundColor: CustomThemeExtension.lightMode.backgroundTertiary,
//         indicatorColor: CustomThemeExtension.lightMode.secondary,
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//       ),
//     );
//   }
// }

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.4.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF39608F),
      primaryContainer: Color(0xFFD0E4FF),
      secondary: Color(0xFFAC3306),
      secondaryContainer: Color(0xFFFFDBCF),
      tertiary: Color(0xFF006875),
      tertiaryContainer: Color(0xFF95F0FF),
      appBarColor: Color(0xFFFFDBCF),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      inputDecoratorIsFilled: true,
      alignedDropdown: true,
      tooltipRadius: 4,
      tooltipSchemeColor: SchemeColor.inverseSurface,
      tooltipOpacity: 0.9,
      snackBarElevation: 6,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      navigationRailUseIndicator: true,
    ),
    // ColorScheme seed generation configuration for light mode.
    keyColors: const FlexKeyColors(),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    extensions: const [CustomThemeExtension.lightMode],
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      primaryLightRef: Color(0xFF39608F), // The color of light mode primary
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      secondaryLightRef: Color(0xFFAC3306), // The color of light mode secondary
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      tertiaryLightRef: Color(0xFF006875), // The color of light mode tertiary
      appBarColor: Color(0xFFFFDBCF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      blendOnColors: true,
      inputDecoratorIsFilled: true,
      alignedDropdown: true,
      tooltipRadius: 4,
      tooltipSchemeColor: SchemeColor.inverseSurface,
      tooltipOpacity: 0.9,
      snackBarElevation: 6,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      navigationRailUseIndicator: true,
    ),
    // ColorScheme seed configuration setup for dark mode.
    keyColors: const FlexKeyColors(),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
