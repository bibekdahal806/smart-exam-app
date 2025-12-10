import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/app_setting/app_setting.dart';
import 'package:q_bank/modules/device_info/cubit/device_info_cubit.dart';
import 'package:q_bank/modules/package_info/cubit/package_info_cubit.dart';
import 'package:q_bank/modules/theme/theme.dart';

class GlobalBlocConfig extends StatelessWidget {
  final Widget child;
  const GlobalBlocConfig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => AppSettingCubit()..refreshOrLoadCurrentSetting(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => PackageInfoCubit()..loadPackageInfo(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => DeviceInfoCubit()..loadDeviceInfo(),
        ),
        BlocProvider(lazy: false, create: (_) => ThemeCubit()),
      ],
      child: child,
    );
  }
}
