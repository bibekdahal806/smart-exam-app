import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepository authRepository = getIt<AuthRepository>();

  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePasswordSubmitted({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ChangePasswordLoading());

    try {
      await authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordError(error: AppErrorHandler.getErrorMessage(e)));
    }
  }
}
