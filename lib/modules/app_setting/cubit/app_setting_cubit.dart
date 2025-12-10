//for app setting such as theme mode and onboarding
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(const AppSettingState());

  final GetOrSetInitialShowOnboardingValueUseCase
  _getOrSetInitialShowOnboardingValueUseCase =
      getIt<GetOrSetInitialShowOnboardingValueUseCase>();

  //default value if null
  final defaultShowOnboardingValue = true;
  final defaultShowSelectLanguageValue = true;
  final defaultSelectedLanguage = LanguageType.english;

  Future<bool> _getShowOnBoardingValue() async {
    var value = await _getOrSetInitialShowOnboardingValueUseCase.execute(
      GetOrSetInitialShowOnboardingValueUseCaseParams(
        showOnboardingValue: defaultShowOnboardingValue,
      ),
    );
    return value;
  }

  Future<void> refreshOrLoadCurrentSetting() async {
    var showOnboardingValue = await _getShowOnBoardingValue();

    emit(state.copyWith(showOnboarding: showOnboardingValue));
  }
}
