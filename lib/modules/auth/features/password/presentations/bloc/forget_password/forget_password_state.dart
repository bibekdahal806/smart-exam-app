part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  const ForgetPasswordError({required this.error});

  @override
  List<Object> get props => [error];
}

final class ForgetPasswordLoading extends ForgetPasswordState {}
