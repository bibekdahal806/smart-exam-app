part of 'login_bloc.dart';

class LoginState extends Equatable {
  final AppLoadingState appLoadingState;
  final String? email;
  final String? password;
  final bool isRememberMe;
  final String? error;

  const LoginState({
    this.appLoadingState = AppLoadingState.initial,
    this.email,
    this.password,
    this.isRememberMe = false,
    this.error,
  });

  LoginState copyWith({
    AppLoadingState? appLoadingState,
    String? email,
    String? password,
    bool? isRememberMe,
    String? error,
  }) => LoginState(
    appLoadingState: appLoadingState ?? this.appLoadingState,
    email: email ?? this.email,
    password: password ?? this.password,
    isRememberMe: isRememberMe ?? this.isRememberMe,
    error: error,
  );
  @override
  List<Object?> get props => [
    appLoadingState,
    email,
    password,
    isRememberMe,
    error,
  ];
}
