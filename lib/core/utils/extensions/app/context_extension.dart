import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/utils/utils.dart';
import 'package:q_bank/modules/app_setting/cubit/app_setting_cubit.dart';

extension BuildContextExtension on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger =>
      ScaffoldMessenger.of(this)..hideCurrentSnackBar();

  void showErrorSnackBarMessage(String message) {
    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.error,
        content: Text(message, style: TextStyle(color: colorScheme.onError)),
      ),
    );
  }

  void showSnackBarMessage(String message) =>
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
}

extension SizeContextExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  ///Auto get device max screen size as width
  double get deviceWidth => Device.width;

  ///Auto get device max screen size as height
  double get deviceHeight => Device.height;
}

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  ColorScheme get colorScheme => theme.colorScheme;
  CustomThemeExtension get customTheme =>
      Theme.of(this).extension<CustomThemeExtension>()!;
}

extension AppSettingContextExtension on BuildContext {
  AppSettingCubit get appSettingCubit => watch<AppSettingCubit>();
  LanguageType get selectedLanguage {
    return appSettingCubit.state.selectedLanguage;
  }
}
