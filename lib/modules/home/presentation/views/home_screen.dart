import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              toolbarHeight: 0,
              backgroundColor: context.theme.primaryColor,
              titleSpacing: 0,
              title: const SizedBox(),
            ),
            PinnedHeaderSliver(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: .only(bottomLeft: Radius.circular(40.r)),
                ),
                child: HomeGreetingCardView(),
              ),
            ),
          ];
        },
        physics: NeverScrollableScrollPhysics(),
        body: SingleChildScrollView(
          child: ParentPaddingWidget(
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                DashboardHomeSection(),
                // 16.verticalSpace,
                // ParentTextWidget(
                //   "Subjects",
                //   style: context.textTheme.headlineSmall?.copyWith(
                //     fontWeight: AppFontWeight.bold,
                //     color: context.customTheme.textPrimary,
                //   ),
                // ),
                // 8.verticalSpace,
                // SubjectListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
