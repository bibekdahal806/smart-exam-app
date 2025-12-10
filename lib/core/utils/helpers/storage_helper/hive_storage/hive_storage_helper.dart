import 'package:q_bank/core/core.dart';
import 'package:hive/hive.dart';

extension SettingDataBoxExtension on HiveInterface {
  Future<Box> openAppSettingDataBox() async {
    return await openBox(HiveBoxNameKeys.appSettingDataBoxName);
  }

  Future<void> deleteAppSettingDataBox() async {
    await Hive.deleteBoxFromDisk(HiveBoxNameKeys.appSettingDataBoxName);
  }

  Future<void> clearAppSettingDataBox() async {
    final box = await Hive.openBox(HiveBoxNameKeys.appSettingDataBoxName);
    await box.clear();
  }

  Box get appSettingDataBox => box(HiveBoxNameKeys.appSettingDataBoxName);
}

extension UserDataBoxExtension on HiveInterface {
  Future<Box> openAppUserDataBox() async {
    return await openBox(HiveBoxNameKeys.loggedUserDataBoxName);
  }

  Future<void> deleteAppUserDataBox() async {
    await Hive.deleteBoxFromDisk(HiveBoxNameKeys.loggedUserDataBoxName);
  }

  Future<void> clearAppUserDataBox() async {
    final box = await Hive.openBox(HiveBoxNameKeys.loggedUserDataBoxName);
    await box.clear();
  }

  Box get appUserDataBox => box(HiveBoxNameKeys.loggedUserDataBoxName);
}
