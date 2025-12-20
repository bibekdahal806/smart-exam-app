import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/domain/use_case/register_user_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUserUseCase _registerUserUseCase = getIt<RegisterUserUseCase>();
  SignupBloc() : super(SignupState()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  FutureOr<void> _onSignupSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(appLoadingState: AppLoadingState.loading));
    try {
      await _registerUserUseCase.execute(
        RegisterUserUseCaseParams(
          address: event.address,
          fullName: event.fullName,
          email: event.email,
          phoneNumber: event.phoneNumber,
          password: event.password,
        ),
      );
      emit(state.copyWith(appLoadingState: AppLoadingState.success));
    } catch (e) {
      emit(
        state.copyWith(
          appLoadingState: AppLoadingState.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }
}
