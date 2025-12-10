import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';

part 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  DeviceInfoCubit() : super(DeviceInfoState());

  Future<void> loadDeviceInfo() async {
    final deviceInfo = Platform.isAndroid
        ? await DeviceInfoPlugin().androidInfo
        : Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : Platform.isMacOS
        ? await DeviceInfoPlugin().macOsInfo
        : Platform.isWindows
        ? await DeviceInfoPlugin().windowsInfo
        : await DeviceInfoPlugin().webBrowserInfo;
    CustomLogger().d("deviceInfo: $deviceInfo");
    emit(state.copyWith(deviceInfo: deviceInfo));
  }
}
