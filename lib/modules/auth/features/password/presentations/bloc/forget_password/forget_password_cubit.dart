import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepository authRepository = getIt<AuthRepository>();
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> forgetPasswordSubmitted({required String email}) async {
    emit(ForgetPasswordLoading());

    try {
      await authRepository.forgetPassword(email: email);
      return emit(ForgetPasswordSuccess());
    } catch (e) {
      return emit(
        ForgetPasswordError(error: AppErrorHandler.getErrorMessage(e)),
      );
    }
  }
}
