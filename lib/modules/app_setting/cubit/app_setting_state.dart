part of 'app_setting_cubit.dart';

@immutable
class AppSettingState extends Equatable {
  const AppSettingState({
    this.showOnboarding = true,
    this.showSelectLanguage = true,
    this.selectedLanguage = LanguageType.english,
  });

  final bool showOnboarding;
  final bool showSelectLanguage;
  final LanguageType selectedLanguage;

  AppSettingState copyWith({
    bool? showOnboarding,
    bool? showSelectLanguage,
    LanguageType? selectedLanguage,
  }) {
    return AppSettingState(
      showOnboarding: showOnboarding ?? this.showOnboarding,
      showSelectLanguage: showSelectLanguage ?? this.showSelectLanguage,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object> get props => [
    showOnboarding,
    showSelectLanguage,
    selectedLanguage,
  ];
}
