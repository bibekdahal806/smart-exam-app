part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final AppLoadingState appLoadingState;
  final String? error;

  const SignupState({
    this.appLoadingState = AppLoadingState.initial,
    this.error,
  });

  SignupState copyWith({AppLoadingState? appLoadingState, String? error}) =>
      SignupState(
        appLoadingState: appLoadingState ?? this.appLoadingState,
        error: error ?? this.error,
      );
  @override
  List<Object?> get props => [appLoadingState, error];
}
