import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:q_bank/core/di/injection.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static final SecureStorageHelper instance = SecureStorageHelper._();

  final _secureStorage = getIt<FlutterSecureStorage>();

  Future<String?> getData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> setData({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<void> removeData({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> removeAllData() async {
    await _secureStorage.deleteAll();
  }

  Future<void> readAllData() async {
    await _secureStorage.readAll();
  }
}
