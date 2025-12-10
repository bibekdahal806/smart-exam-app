import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';

class DashboardNavbarWidget extends StatelessWidget {
  final PageController _pageController;

  const DashboardNavbarWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
      listener: (context, state) {
        _pageController.jumpToPage(state.currentIndex);
      },
      builder: (context, state) {
        return NavigationBar(
          // backgroundColor: context.customTheme.backgroundPrimary,
          selectedIndex: state.currentIndex,
          onDestinationSelected: (index) async {
            BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home), label: "Home2"),
            NavigationDestination(icon: Icon(Icons.home), label: "Home3"),
          ],
          //
        );
      },
    );
  }
}
