import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  // Base colors
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color accent;
  final Color onAccent;
  final Color active;
  final Color onActive;

  final Color backgroundPrimary;
  final Color onBackgroundPrimary;

  final Color backgroundSecondary;
  final Color onBackgroundSecondary;

  final Color backgroundTertiary;
  final Color onBackgroundTertiary;

  final Color surface;
  final Color onSurface;

  final Color border;

  // Text tokens
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textPlaceholder;
  final Color textLabel;
  final Color textInverse;

  // Status / Feedback
  final Color success;
  final Color onSuccess;
  final Color error;
  final Color onError;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  // Buttons / Interaction
  final Color buttonWarning;
  final Color onButtonWarning;
  final Color hover;
  //utilities
  final Color icon;
  final Color shimmerBase;
  final Color shimmerHighlight;

  const CustomThemeExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.accent,
    required this.onAccent,
    required this.active,
    required this.onActive,
    required this.backgroundPrimary,
    required this.onBackgroundPrimary,
    required this.backgroundSecondary,
    required this.onBackgroundSecondary,
    required this.backgroundTertiary,
    required this.onBackgroundTertiary,
    required this.surface,
    required this.onSurface,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textPlaceholder,
    required this.textLabel,
    required this.textInverse,
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.buttonWarning,
    required this.onButtonWarning,
    required this.hover,
    required this.icon,
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  static const lightMode = CustomThemeExtension(
    primary: AppColors.primary,
    onPrimary: AppColors.textInverse,
    secondary: AppColors.secondary,
    onSecondary: AppColors.textInverse,
    accent: AppColors.accent,
    onAccent: AppColors.textInverse,
    active: AppColors.accent,
    onActive: AppColors.textInverse,
    backgroundPrimary: AppColors.backgroundPrimary,
    onBackgroundPrimary: AppColors.textPrimary,
    backgroundSecondary: AppColors.backgroundSecondary,
    onBackgroundSecondary: AppColors.textPrimary,
    backgroundTertiary: AppColors.backgroundTertiary,
    onBackgroundTertiary: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    border: AppColors.borderDefault,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textTertiary: AppColors.textTertiary,
    textPlaceholder: AppColors.textPlaceholder,
    textLabel: AppColors.borderLight,
    textInverse: AppColors.textInverse,
    success: AppColors.success,
    onSuccess: AppColors.textInverse,
    error: AppColors.error,
    onError: AppColors.textInverse,
    warning: AppColors.warning,
    onWarning: AppColors.textInverse,
    info: AppColors.info,
    onInfo: AppColors.textInverse,
    buttonWarning: AppColors.warning,
    onButtonWarning: AppColors.textPrimary,
    hover: AppColors.hover,
    icon: AppColors.icon,
    shimmerBase: AppColors.shimmerBase,
    shimmerHighlight: AppColors.shimmerHighlight,
  );

  @override
  CustomThemeExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? accent,
    Color? onAccent,
    Color? active,
    Color? onActive,
    Color? backgroundPrimary,
    Color? onBackgroundPrimary,
    Color? backgroundSecondary,
    Color? onBackgroundSecondary,
    Color? backgroundTertiary,
    Color? onBackgroundTertiary,
    Color? surface,
    Color? onSurface,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textPlaceholder,
    Color? textLabel,
    Color? textInverse,
    Color? success,
    Color? onSuccess,
    Color? error,
    Color? onError,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? buttonWarning,
    Color? onButtonWarning,
    Color? hover,
    Color? icon,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return CustomThemeExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      active: active ?? this.active,
      onActive: onActive ?? this.onActive,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      onBackgroundPrimary: onBackgroundPrimary ?? this.onBackgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      onBackgroundSecondary:
          onBackgroundSecondary ?? this.onBackgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      onBackgroundTertiary: onBackgroundTertiary ?? this.onBackgroundTertiary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textLabel: textLabel ?? this.textLabel,
      textInverse: textInverse ?? this.textInverse,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      buttonWarning: buttonWarning ?? this.buttonWarning,
      onButtonWarning: onButtonWarning ?? this.onButtonWarning,
      hover: hover ?? this.hover,
      icon: icon ?? this.icon,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  CustomThemeExtension lerp(
    covariant ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      active: Color.lerp(active, other.active, t)!,
      onActive: Color.lerp(onActive, other.onActive, t)!,
      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      onBackgroundPrimary: Color.lerp(
        onBackgroundPrimary,
        other.onBackgroundPrimary,
        t,
      )!,
      backgroundSecondary: Color.lerp(
        backgroundSecondary,
        other.backgroundSecondary,
        t,
      )!,
      onBackgroundSecondary: Color.lerp(
        onBackgroundSecondary,
        other.onBackgroundSecondary,
        t,
      )!,
      backgroundTertiary: Color.lerp(
        backgroundTertiary,
        other.backgroundTertiary,
        t,
      )!,
      onBackgroundTertiary: Color.lerp(
        onBackgroundTertiary,
        other.onBackgroundTertiary,
        t,
      )!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textLabel: Color.lerp(textLabel, other.textLabel, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      buttonWarning: Color.lerp(buttonWarning, other.buttonWarning, t)!,
      onButtonWarning: Color.lerp(onButtonWarning, other.onButtonWarning, t)!,
      hover: Color.lerp(hover, other.hover, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(
        shimmerHighlight,
        other.shimmerHighlight,
        t,
      )!,
    );
  }
}
