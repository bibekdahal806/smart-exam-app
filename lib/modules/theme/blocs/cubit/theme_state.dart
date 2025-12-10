part of 'theme_cubit.dart';

class ThemeModeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeModeState({this.themeMode = ThemeMode.light});

  @override
  List<Object?> get props => <Object?>[themeMode];
}
