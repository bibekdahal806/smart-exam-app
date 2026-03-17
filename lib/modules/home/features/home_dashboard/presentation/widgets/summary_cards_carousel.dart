import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class SummaryCardsCarousel extends StatefulWidget {
  final DashboardSummaryEntity summary;

  const SummaryCardsCarousel({super.key, required this.summary});

  @override
  State<SummaryCardsCarousel> createState() => _SummaryCardsCarouselState();
}

class _SummaryCardsCarouselState extends State<SummaryCardsCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.46);
  int _currentIndex = 0;

  late final List<_SummaryCardData> _items = [
    _SummaryCardData(
      title: 'Overall Score',
      value: widget.summary.overallScore.toString(),
    ),
    _SummaryCardData(
      title: 'Attempted Exams',
      value: widget.summary.attemptedExams.toString(),
    ),
    _SummaryCardData(
      title: 'Passed Exams',
      value: widget.summary.passedExams.toString(),
    ),
    _SummaryCardData(
      title: 'Failed Exams',
      value: widget.summary.failedExams.toString(),
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
          height: 118,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final item = _items[index];
              return Padding(
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
    return Container(
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
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF2F80ED),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              item.value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A2A2A),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCardData {
  final String title;
  final String value;

  const _SummaryCardData({required this.title, required this.value});
}
