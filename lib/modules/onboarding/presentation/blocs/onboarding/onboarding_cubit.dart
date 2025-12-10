import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());
  final SetShowOnboardingValueUseCase _setShowOnboardingValueUseCase =
      getIt<SetShowOnboardingValueUseCase>();

  void loadOnBoarding(bool showOnboardingValue) {
    try {
      emit(
        state.copyWith(
          showOnboardingValue: showOnboardingValue,
          loadingState: AppLoadingState.success,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(loadingState: AppLoadingState.failure, error: e.message),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> setOnBoardingValue({required bool showOnboardingValue}) async {
    try {
      emit(state.copyWith(loadingState: AppLoadingState.loading));
      await _setShowOnboardingValueUseCase.execute(
        SetShowOnboardingValueUseCaseParams(
          showOnboardingValue: showOnboardingValue,
        ),
      );
      emit(
        state.copyWith(
          showOnboardingValue: showOnboardingValue,
          loadingState: AppLoadingState.success,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(loadingState: AppLoadingState.failure, error: e.message),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          error: e.toString(),
        ),
      );
    }
  }
}
