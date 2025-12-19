//Registration of services and repositories with the DI container.
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/modules/auth/auth.dart';

@module
abstract class ServiceModule {
  @lazySingleton
  Dio get dio => Dio();

  @Singleton()
  FlutterSecureStorage get secureStorage => FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIOSOptions(),
  );

  @singleton
  Connectivity connectivity() => Connectivity();

  @singleton
  UserSessionRepository get userSessionRepository =>
      UserSessionRepositoryImpl();
}

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

IOSOptions _getIOSOptions() =>
    const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
