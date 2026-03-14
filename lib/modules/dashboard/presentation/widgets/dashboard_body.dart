import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:q_bank/modules/home/home.dart';
import 'package:q_bank/modules/profile/profile.dart';

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
        HomeScreen(),
        DashboardExamScreen(),
        BookmarkedExamsScreen(),
        ProfileScreen(),
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
