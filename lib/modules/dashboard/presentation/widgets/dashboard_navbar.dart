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
          selectedIndex: state.currentIndex,
          onDestinationSelected: (index) async {
            BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.chrome_reader_mode_rounded),
              label: "Subjects",
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_rounded),
              label: "Bookmarks",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_rounded),
              label: "Profile",
            ),
          ],
          //
        );
      },
    );
  }
}

///exam report filter by subject
