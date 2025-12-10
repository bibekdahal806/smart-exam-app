import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Duration splashDuration = AppConstants.splashDuration;

  Future<void> splashCompleter() async {
    emit(state.copyWith(splashStatus: AppLoadingState.loading));
    // Initialize connectivity BEFORE finishing splash
    await getIt<ConnectivityHelper>().init();
    // Optionally wait for splash screen animation

    await Future.delayed(splashDuration);

    emit(state.copyWith(splashStatus: AppLoadingState.success));
  }
}
