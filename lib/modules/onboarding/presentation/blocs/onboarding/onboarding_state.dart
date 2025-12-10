part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final AppLoadingState loadingState;
  final bool showOnboardingValue;
  final String error;
  const OnboardingState({
    this.loadingState = AppLoadingState.initial,
    this.showOnboardingValue = false,
    this.error = '',
  });
  OnboardingState copyWith({
    AppLoadingState? loadingState,
    bool? showOnboardingValue,
    String? error,
  }) => OnboardingState(
    loadingState: loadingState ?? this.loadingState,
    showOnboardingValue: showOnboardingValue ?? this.showOnboardingValue,
    error: error ?? this.error,
  );

  @override
  List<Object> get props => [loadingState, showOnboardingValue, error];
}
