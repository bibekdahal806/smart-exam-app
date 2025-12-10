import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';

class DashboardBodyWidget extends StatelessWidget {
  final PageController _pageController;

  const DashboardBodyWidget({super.key, required PageController pageController})
    : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        BlocProvider.of<BottomNavigationCubit>(context).changePage(index);
      },
      children: [
        Center(child: Text("Home1")),
        Center(child: Text("Home2")),
        Center(child: Text("Home3")),
      ],
    );
  }
}

  // ContributorScreen(),
        // RashifalScreen(),
        // WebViewScreen(
        //   key: PageStorageKey('personal_screen'),
        //   initialUrl: Urls.personalUrl,
        // ),
        // WebViewScreen(
        //   key: PageStorageKey('webview_screen'),
        //   initialUrl: Urls.yesHelpingHandUrl,
        // ),
