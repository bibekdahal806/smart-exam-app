import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

@injectable
class GetOrSetInitialShowOnboardingValueUseCase
    extends UseCase<bool, GetOrSetInitialShowOnboardingValueUseCaseParams> {
  GetOrSetInitialShowOnboardingValueUseCase(this._onboardingRepository);

  final OnboardingRepository _onboardingRepository;

  @override
  Future<bool> execute(
    GetOrSetInitialShowOnboardingValueUseCaseParams params,
  ) async {
    return await _onboardingRepository.getOrSetInitialShowOnboardingValue(
      params.showOnboardingValue,
    );
  }
}

class GetOrSetInitialShowOnboardingValueUseCaseParams extends Equatable {
  const GetOrSetInitialShowOnboardingValueUseCaseParams({
    required this.showOnboardingValue,
  });

  final bool showOnboardingValue;

  @override
  List<Object?> get props => [showOnboardingValue];
}
