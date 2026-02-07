import 'package:bloc/bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:equatable/equatable.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountState());
  final DeleteAccountUseCase _deleteAccountUseCase =
      getIt<DeleteAccountUseCase>();

  Future<void> onDeleteAccountSubmitted() async {
    emit(state.copyWith(appLoadingState: AppLoadingState.loading));
    try {
      await _deleteAccountUseCase.execute(
        DeleteAccountUseCaseParams(deleteType: state.deleteType),
      );
      emit(state.copyWith(appLoadingState: AppLoadingState.success));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          appLoadingState: AppLoadingState.failure,
          error: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          appLoadingState: AppLoadingState.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> onToggleDeleteType(DeleteType? deleteType) async {
    emit(state.copyWith(deleteType: deleteType));
  }
}
