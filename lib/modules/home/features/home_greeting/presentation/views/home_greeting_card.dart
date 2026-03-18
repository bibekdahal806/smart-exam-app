import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class HomeGreetingCardView extends StatelessWidget {
  const HomeGreetingCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        // Row(
        //   mainAxisAlignment: .start,
        //   children: [
        //     ParentPaddingWidget(
        //       child: CustomImageAvatar.network(
        //         imageUrl: '',

        //         //
        //       ),
        //     ),
        //   ],
        // ),
        HomeGreetingTextWidget(),
        // AppGaps.gapH2,
        HomeExamQuoteCard(),
        // AppGaps.gapH16,
        // HomeSearchBarWidget(),
      ],
    );
  }
}
