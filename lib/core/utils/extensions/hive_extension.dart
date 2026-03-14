import 'package:hive/hive.dart';
import 'package:q_bank/core/core.dart';

extension HiveBoxExtension on HiveInterface {
  Future<void> openAppBox() async {
    await openAppSettingDataBox();
    await openAppUserDataBox();
    await openPendingExamsDataBox();
    await openBookmarkedExamsDataBox();
  }

  Future<void> clearAppBox() async {
    await clearAppSettingDataBox();
    await clearAppUserDataBox();
    await clearPendingExamsDataBox();
    await clearBookmarkedExamsDataBox();
  }
}
