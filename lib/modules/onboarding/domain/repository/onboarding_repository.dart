abstract class OnboardingRepository {
  Future<bool> getOrSetInitialShowOnboardingValue(
    bool defaultShowOnboardingValue,
  );
  Future<void> setShowOnboardingValue(bool showOnboardingValue);
}
