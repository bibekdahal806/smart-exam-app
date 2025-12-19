import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/utils/utils.dart';
import 'package:q_bank/modules/app_setting/cubit/app_setting_cubit.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';

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

extension AuthContextExtension on BuildContext {
  AuthBloc get authBloc => read<AuthBloc>();
  AuthState get authState => watch<AuthBloc>().state;

  // Helper methods for easy auth state checking
  bool get isAuthenticated => authState is AuthUserAuthenticated;
  bool get isUnauthenticated => authState is AuthUserUnauthenticated;
  bool get isAuthLoading => authState is AuthInitial;

  UserEntity? get currentUser {
    final state = authState;
    return state is AuthUserAuthenticated ? state.user : null;
  }

  String? get currentUserFullName {
    var user = currentUser;
    if (user == null) return null;

    final first = user.firstName?.capitalize();
    final middle = user.middleName?.capitalize();
    final last = user.lastName?.capitalize();

    final fullName = [
      first,
      middle,
      last,
    ].where((part) => part?.trim().isNotEmpty ?? false).join(' ');

    return fullName.isEmpty
        ? user.email?.split("@").first.capitalize()
        : fullName;
  }

  String? get currentUserShortName {
    var user = currentUser;
    if (user == null) return null;

    final first = user.firstName?.capitalize();

    return first.isNullOrEmpty
        ? user.email?.split("@").first.capitalize()
        : first;
  }
}
