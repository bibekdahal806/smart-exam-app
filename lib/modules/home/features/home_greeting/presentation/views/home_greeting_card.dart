import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/home/home.dart';

class HomeGreetingCardView extends StatelessWidget {
  const HomeGreetingCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        HomeGreetingTextWidget(),
        AppGaps.gapH2,
        HomeSearchBarWidget(),
      ],
    );
  }
}
