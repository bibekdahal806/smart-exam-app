import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:q_bank/modules/home/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CardSwiperController controller = CardSwiperController();
  List<Widget> cards(BuildContext ctx) => [
    GestureDetector(
      onTap: () {
        Navigator.of(
          ctx,
        ).push(MaterialPageRoute(builder: (context) => const ExamScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text('1'),
        color: Colors.blue,
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.of(
          ctx,
        ).push(MaterialPageRoute(builder: (context) => const ExamScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text('1'),
        color: Colors.blue,
      ),
    ),
  ];
  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (previousIndex > (currentIndex ?? 0)) {
      CustomSnackbar.showToastMessage(
        type: .info,
        message: "To see updated exams please refresh",
      );
    }
    return true;
  }

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
                decoration: BoxDecoration(color: context.theme.primaryColor),
                child: HomeGreetingCardView(),
              ),
            ),
          ];
        },
        physics: NeverScrollableScrollPhysics(),
        body: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Flexible(
              child: SizedBox(
                height: context.deviceHeight * 0.5,
                child: CardSwiper(
                  cardsCount: cards(context).length,
                  onSwipe: _onSwipe,
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) =>
                          cards(context)[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
