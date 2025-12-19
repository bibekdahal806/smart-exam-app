part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginWithEmailPasswordSubmitted extends LoginEvent {
  final String email;
  final String password;
  const LoginWithEmailPasswordSubmitted({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

class LoginRememberMeToggled extends LoginEvent {
  const LoginRememberMeToggled();

  @override
  List<Object?> get props => [];
}
