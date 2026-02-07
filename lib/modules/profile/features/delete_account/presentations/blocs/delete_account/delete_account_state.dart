part of 'delete_account_cubit.dart';

class DeleteAccountState extends Equatable {
  final AppLoadingState appLoadingState;
  final DeleteType deleteType;

  final String error;
  const DeleteAccountState({
    this.appLoadingState = AppLoadingState.initial,
    this.deleteType = DeleteType.deactivate,
    this.error = '',
  });

  DeleteAccountState copyWith({
    AppLoadingState? appLoadingState,
    DeleteType? deleteType,
    String? error,
  }) {
    return DeleteAccountState(
      appLoadingState: appLoadingState ?? this.appLoadingState,
      deleteType: deleteType ?? this.deleteType,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [appLoadingState, deleteType, error];
}
