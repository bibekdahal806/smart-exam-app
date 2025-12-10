part of 'device_info_cubit.dart';

class DeviceInfoState extends Equatable {
  final BaseDeviceInfo? deviceInfo;
  const DeviceInfoState({this.deviceInfo});

  @override
  List<Object?> get props => [deviceInfo];

  DeviceInfoState copyWith({BaseDeviceInfo? deviceInfo}) {
    return DeviceInfoState(deviceInfo: deviceInfo ?? this.deviceInfo);
  }
}
