import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:q_bank/apps/apps.dart';
import 'package:q_bank/common/common.dart';

import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set hydrated bloc storage
  await _setUpHydratedStorage();

  // initializing env helper
  await initializeEnvHelper();

  //firebase releated setup
  // await firebaseSetup();

  // initializing hive
  await _initializeHive();

  // initiating bloc observer
  Bloc.observer = AppBlocObserver();

  //locking device orientation to potrait view
  setDeviceOrientationToPortrait();

  //awaiting di
  configureDependencyInjection();

  // await SecureStorageHelper.instance.removeAllData();
  // await Hive.clearAppBox();

  runApp(const QBankApp());
  //config that can also be run after initial setup
  // await firebaseCrashlyticsAndAnalyticsSetup();
}

void setDeviceOrientationToPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  await Hive.openAppBox();
}

Future<void> initializeEnvHelper() async {
  // loading env file
  await EnvHelper.init();
}

Future<void> _setUpHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
}

// Future<void> firebaseSetup() async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// }

// Future<void> firebaseCrashlyticsAndAnalyticsSetup() async {
//   if (kReleaseMode) {
//     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

//     FlutterError.onError = (errorDetails) {
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     };
//     // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//   } else {
//     // Disable Crashlytics in debug mode
//     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
//   }

//   // Firebase Analytics can be used in all modes if needed
//   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//   await analytics.logAppOpen();
// }
