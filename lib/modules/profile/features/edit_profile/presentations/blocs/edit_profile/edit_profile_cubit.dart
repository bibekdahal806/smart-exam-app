import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:q_bank/modules/user/user.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());

  final EditUserDataUsecase _editUserDataUsecase = getIt<EditUserDataUsecase>();

  Future<void> onSubmit({
    required UserEntity userEntity,
    String? imagePath,
  }) async {
    emit(state.copyWith(appLoadingState: AppLoadingState.loading));
    try {
      await _editUserDataUsecase.execute(
        EditUserDataUsecaseParams(userEntity: userEntity, imagePath: imagePath),
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

  void clearErrror() {
    emit(state.copyWith(error: ""));
  }
}
