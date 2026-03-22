import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/home/home.dart';

class SummaryCardsCarousel extends StatefulWidget {
  final SummaryEntity? summary;

  const SummaryCardsCarousel({super.key, required this.summary});

  @override
  State<SummaryCardsCarousel> createState() => _SummaryCardsCarouselState();
}

class _SummaryCardsCarouselState extends State<SummaryCardsCarousel> {
  final PageController _pageController = PageController(
    viewportFraction: 0.46,
    initialPage: 1,
  );
  int _currentIndex = 1;

  late final List<_SummaryCardData> _items = [
    _SummaryCardData(
      title: 'Overall Score',
      value: widget.summary?.overallScore.toString() ?? "0",
    ),
    _SummaryCardData(
      title: 'Attempted Exams',
      value: widget.summary?.attemptedExams.toString() ?? "0",
    ),
    _SummaryCardData(
      title: 'Passed Exams',
      value: widget.summary?.passedExams.toString() ?? "0",
    ),
    _SummaryCardData(
      title: 'Failed Exams',
      value: widget.summary?.failedExams.toString() ?? "0",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final item = _items[index];
              return Container(
                margin: .symmetric(vertical: 5),
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 6,
                  right: index == _items.length - 1 ? 16 : 6,
                ),
                child: _SummaryMetricCard(item: item),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _items.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 7,
              width: _currentIndex == index ? 20 : 7,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? const Color(0xFF2F80ED)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryMetricCard extends StatelessWidget {
  final _SummaryCardData item;

  const _SummaryMetricCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: const BoxDecoration(
                color: Color(0xFF2F80ED),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                item.value,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            5.verticalSpace,
            Flexible(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                  color: const Color(0xFF2A2A2A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCardData {
  final String title;
  final String value;

  const _SummaryCardData({required this.title, required this.value});
}
