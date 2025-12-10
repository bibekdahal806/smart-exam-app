//Theme configuration parameters that can be adjusted based on environment or user settings.
import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class ThemeConfigs {
  static ThemeData lightTheme({String locale = 'en'}) {
    return ThemeData(
      fontFamily: locale.toLowerCase() == 'ne' || locale.toLowerCase() == 'hi'
          ? AppConstants.devnagariFont
          : AppConstants.englishFont,
      extensions: const [CustomThemeExtension.lightMode],
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        displayMedium: AppTextStyle.displayMedium.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        displaySmall: AppTextStyle.displaySmall.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        headlineLarge: AppTextStyle.headlineLarge.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        headlineMedium: AppTextStyle.headlineMedium.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        headlineSmall: AppTextStyle.headlineSmall.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        titleLarge: AppTextStyle.titleLarge.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        titleMedium: AppTextStyle.titleMedium.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        titleSmall: AppTextStyle.titleSmall.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        bodyLarge: AppTextStyle.bodyLarge.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        bodyMedium: AppTextStyle.bodyMedium.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        bodySmall: AppTextStyle.bodySmall.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        labelLarge: AppTextStyle.button.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        labelMedium: AppTextStyle.caption.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
        labelSmall: AppTextStyle.underline.copyWith(
          color: CustomThemeExtension.lightMode.textPrimary,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.isSelected) {
            return CustomThemeExtension.lightMode.textSecondary;
          }
          return CustomThemeExtension.lightMode.backgroundPrimary;
        }),
        checkColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          return CustomThemeExtension.lightMode.backgroundPrimary;
        }),
        side: BorderSide(
          color: CustomThemeExtension.lightMode.border,
          width: 1.r,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: CustomThemeExtension.lightMode.backgroundTertiary,
        indicatorColor: CustomThemeExtension.lightMode.secondary,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}
