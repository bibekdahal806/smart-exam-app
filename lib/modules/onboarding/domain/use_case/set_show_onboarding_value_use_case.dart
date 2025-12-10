import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

@injectable
class SetShowOnboardingValueUseCase
    extends UseCase<Future<void>, SetShowOnboardingValueUseCaseParams> {
  SetShowOnboardingValueUseCase(this._selectLanguageRepository);

  final OnboardingRepository _selectLanguageRepository;

  @override
  Future<void> execute(SetShowOnboardingValueUseCaseParams params) async {
    _selectLanguageRepository.setShowOnboardingValue(
      params.showOnboardingValue,
    );
  }
}

class SetShowOnboardingValueUseCaseParams extends Equatable {
  const SetShowOnboardingValueUseCaseParams({
    required this.showOnboardingValue,
  });

  final bool showOnboardingValue;

  @override
  List<Object?> get props => [showOnboardingValue];
}
