import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class HomeDashboardSuccessView extends StatelessWidget {
  final DashboardEntity dashboard;
  const HomeDashboardSuccessView({super.key, required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryCardsCarousel(summary: dashboard.summary),
        const SizedBox(height: 20),
        PerformanceChartCard(data: dashboard.performanceOvertime),
        const SizedBox(height: 20),
        SubjectwiseStrengthCard(subjects: dashboard.subjectwiseStrength ?? []),
      ],
    );
  }
}
