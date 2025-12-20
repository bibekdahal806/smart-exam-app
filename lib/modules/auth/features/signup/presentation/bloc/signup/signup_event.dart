part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String password;
  const SignupSubmitted({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
  });
  @override
  List<Object> get props => [fullName, email, address, phoneNumber, password];
}
