import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// @Injectable(as: OnboardingRepository)
// class OnboardingRepositoryImpl implements OnboardingRepository {
//   final SecureStorageHelper _pref = SecureStorageHelper.instance;
//   final _showOnboardingIdKey = StorageKeys.showOnboardingKey;

//   @override
//   Future<bool> getOrSetInitialShowOnboardingValue(
//     bool defaultShowOnboardingValue,
//   ) async {
//     final storedShowOnboardingValue = await _pref.getData(
//       key: _showOnboardingIdKey,
//     );
//     if (storedShowOnboardingValue != null) {
//       return storedShowOnboardingValue == "true";
//     } else {
//       await setShowOnboardingValue(defaultShowOnboardingValue);
//       return defaultShowOnboardingValue;
//     }
//   }

//   @override
//   Future<void> setShowOnboardingValue(bool showOnboardingValue) async {
//     await _pref.setData(
//       key: _showOnboardingIdKey,
//       value: showOnboardingValue.toString(),
//     );
//   }
// }

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  var box = Hive.appSettingDataBox;
  final _showOnboardingIdKey = HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.appSettingDataBoxName,
    keyName: HiveTableKeys.showOnBoardingKey,
  );

  @override
  Future<bool> getOrSetInitialShowOnboardingValue(
    bool defaultShowOnboardingValue,
  ) async {
    final storedShowOnboardingValue = await box.get(_showOnboardingIdKey);
    if (storedShowOnboardingValue != null) {
      return storedShowOnboardingValue;
    } else {
      await setShowOnboardingValue(defaultShowOnboardingValue);
      return defaultShowOnboardingValue;
    }
  }

  @override
  Future<void> setShowOnboardingValue(bool showOnboardingValue) async {
    await box.put(_showOnboardingIdKey, showOnboardingValue);
  }
}
