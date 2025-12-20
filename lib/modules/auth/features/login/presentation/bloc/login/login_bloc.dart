import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase =
      getIt<LoginWithEmailAndPasswordUseCase>();
  LoginBloc() : super(LoginState()) {
    on<LoginWithEmailPasswordSubmitted>(_onLoginWithEmailPasswordSubmitted);
    on<LoginRememberMeToggled>(_onLoginRememberMeToggled);
    on<LoginClearError>(_onLoginClearError);
  }

  FutureOr<void> _onLoginWithEmailPasswordSubmitted(
    LoginWithEmailPasswordSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(appLoadingState: AppLoadingState.loading));
    try {
      await _loginWithEmailAndPasswordUseCase.execute(
        LoginWithEmailAndPasswordUseCaseParams(
          email: event.email,
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

  FutureOr<void> _onLoginRememberMeToggled(
    LoginRememberMeToggled event,
    Emitter<LoginState> emit,
  ) {
    var initialValue = state.isRememberMe;
    emit(state.copyWith(isRememberMe: !initialValue));
  }

  FutureOr<void> _onLoginClearError(
    LoginClearError event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(error: null));
  }
}
