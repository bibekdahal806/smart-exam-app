import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),

        //
      ],

      child: DashboardScreenView(),
    );
  }
}

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    context.read<BottomNavigationCubit>().changePage(
      _pageController.initialPage,
    );
    super.initState();
  }

  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        bool isHomePage = _pageController.page == 0;
        if (isHomePage) {
          final now = DateTime.now();
          if (_lastBackPressed == null ||
              now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
            _lastBackPressed = now;

            // Show a toast or snackbar
            CustomSnackbar.showToastMessage(
              message: "Press back again to exit",
              type: ToastType.info,
            );
            return;
          }

          // Exit the app
          SystemNavigator.pop();
        } else {
          BlocProvider.of<BottomNavigationCubit>(context).changePage(0);
        }
      },
      child: Scaffold(
        backgroundColor: context.customTheme.backgroundPrimary,
        body: DashboardBodyWidget(pageController: _pageController),
        bottomNavigationBar: DashboardNavbarWidget(
          pageController: _pageController,
        ),
      ),
    );
  }
}
