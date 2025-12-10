import 'package:q_bank/core/core.dart';
import 'package:hive/hive.dart';

extension HiveBoxExtension on HiveInterface {
  Future<void> openAppBox() async {
    await openAppSettingDataBox();
    await openAppUserDataBox();
  }

  Future<void> clearAppBox() async {
    await clearAppSettingDataBox();
    await clearAppUserDataBox();
  }
}
