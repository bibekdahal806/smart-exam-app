import 'package:hive/hive.dart';
import 'package:q_bank/core/core.dart';

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

extension PendingExamsDataBoxExtension on HiveInterface {
  Future<Box> openPendingExamsDataBox() async {
    return await openBox(HiveBoxNameKeys.pendingExamsDataBoxName);
  }

  Future<void> deletePendingExamsDataBox() async {
    await Hive.deleteBoxFromDisk(HiveBoxNameKeys.pendingExamsDataBoxName);
  }

  Future<void> clearPendingExamsDataBox() async {
    final box = await Hive.openBox(HiveBoxNameKeys.pendingExamsDataBoxName);
    await box.clear();
  }

  Box get pendingExamsDataBox => box(HiveBoxNameKeys.pendingExamsDataBoxName);
}

extension BookmarkedExamsDataBoxExtension on HiveInterface {
  Future<Box> openBookmarkedExamsDataBox() async {
    return await openBox(HiveBoxNameKeys.bookmarkedExamsDataBoxName);
  }

  Future<void> deleteBookmarkedExamsDataBox() async {
    await deleteBoxFromDisk(HiveBoxNameKeys.bookmarkedExamsDataBoxName);
  }

  Future<void> clearBookmarkedExamsDataBox() async {
    final box = await openBox(HiveBoxNameKeys.bookmarkedExamsDataBoxName);
    await box.clear();
  }

  Box get bookmarkedExamsDataBox =>
      box(HiveBoxNameKeys.bookmarkedExamsDataBoxName);
}
