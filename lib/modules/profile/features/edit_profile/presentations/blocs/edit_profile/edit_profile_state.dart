part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final AppLoadingState appLoadingState;
  final String error;

  const EditProfileState({
    this.appLoadingState = AppLoadingState.initial,
    this.error = '',
  });

  EditProfileState copyWith({AppLoadingState? appLoadingState, String? error}) {
    return EditProfileState(
      appLoadingState: appLoadingState ?? this.appLoadingState,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [appLoadingState, error];
}
