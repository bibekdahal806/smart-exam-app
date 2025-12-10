import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/theme/theme.dart';

extension AppSettingBuildContextExtension on BuildContext {
  ThemeMode get selectedTheme {
    return watch<ThemeCubit>().state.themeMode;
  }
}
