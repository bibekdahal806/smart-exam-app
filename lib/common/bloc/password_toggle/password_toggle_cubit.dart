import 'package:flutter_bloc/flutter_bloc.dart';

///This is used to for managing the state of password obscureText
class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit()
      : super(PasswordVisibilityState(isPasswordVisible: false));

  void togglePasswordVisibility() {
    emit(PasswordVisibilityState(isPasswordVisible: !state.isPasswordVisible));
  }
}

// Events
abstract class PasswordVisibilityEvent {}

// State
class PasswordVisibilityState {
  final bool isPasswordVisible;

  PasswordVisibilityState({required this.isPasswordVisible});
}

class TogglePasswordVisibilityEvent extends PasswordVisibilityEvent {}
