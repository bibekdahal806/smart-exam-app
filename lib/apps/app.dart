import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/theme/theme.dart';

class QBankApp extends StatelessWidget {
  const QBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocConfig(child: QBankAppView());
  }
}

class QBankAppView extends StatelessWidget {
  const QBankAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// setting device screen size for responsiveness
        Device.setScreenSize(context, constraints);
        return BlocBuilder<ThemeCubit, ThemeModeState>(
          builder: (context, themeModeState) {
            return MaterialApp.router(
              /// app title
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,

              /// theme config
              theme: ThemeConfigs.lightTheme(),
              darkTheme: ThemeConfigs.lightTheme(),
              themeMode: themeModeState.themeMode,

              /// routing config
              routerConfig: router,

              ///builder
              builder: (_, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: MediaQuery.of(
                    context,
                  ).textScaler.clamp(maxScaleFactor: 1.2),
                ),
                child: child!,
              ),
            );
          },
        );
      },
    );
  }
}
