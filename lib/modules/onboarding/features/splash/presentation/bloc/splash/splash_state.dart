part of 'splash_cubit.dart';

final class SplashState extends Equatable {
  const SplashState({this.splashStatus = AppLoadingState.initial});

  final AppLoadingState splashStatus;

  SplashState copyWith({AppLoadingState? splashStatus}) {
    return SplashState(splashStatus: splashStatus ?? this.splashStatus);
  }

  @override
  List<Object?> get props => [splashStatus];
}
