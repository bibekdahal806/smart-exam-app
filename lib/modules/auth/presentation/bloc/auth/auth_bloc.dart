import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CustomLogger _log = CustomLogger(title: "Auth Bloc");
  AuthBloc() : super(const AuthInitial()) {
    on<AuthInitialCheckRequested>(_onInitialAuthChecked);
    on<AuthOnCurrentUserChanged>(_onCurrentUserChanged);
    on<AuthLogoutButtonPressed>(_onLogoutButtonPressed);

    _startUserSubscription();
  }

  final GetLoggedInUserUseCase _getLoggedInUserUseCase =
      getIt<GetLoggedInUserUseCase>();
  final GetCurrentAuthStateUseCase _getAuthStateUseCase =
      getIt<GetCurrentAuthStateUseCase>();
  final LogoutUseCase _logoutUseCase = getIt<LogoutUseCase>();

  late final StreamSubscription<UserEntity?> _authSubscription;

  void _startUserSubscription() {
    _log.i("User Subscription started");
    _authSubscription = _getAuthStateUseCase
        .execute(NoParams())
        .listen((user) => add(AuthOnCurrentUserChanged(user)));
  }

  Future<void> _onInitialAuthChecked(
    AuthInitialCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    UserEntity? signedInUser = await _getLoggedInUserUseCase.execute(
      NoParams(),
    );
    signedInUser != null
        ? emit(AuthUserAuthenticated(signedInUser))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onCurrentUserChanged(
    AuthOnCurrentUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    event.user != null
        ? emit(AuthUserAuthenticated(event.user!))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onLogoutButtonPressed(
    AuthLogoutButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUseCase.execute(NoParams());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
