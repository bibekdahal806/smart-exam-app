import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class PerformanceChartCard extends StatelessWidget {
  final PerformanceOvertimeEntity? data;

  const PerformanceChartCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if ((data?.chartPoints ?? []).isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: const SizedBox(
          height: 220,
          child: Center(child: Text('No performance data available')),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance Overtime',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(height: 220, child: LineChart(_buildChartData())),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: Color(0xFF2F80ED), label: 'Your Score'),
              SizedBox(width: 18),
              _LegendDot(
                color: Color(0xFFBDBDBD),
                label: 'Average Student Score',
              ),
            ],
          ),
        ],
      ),
    );
  }

  LineChartData _buildChartData() {
    final studentSpots = <FlSpot>[];
    final averageSpots = <FlSpot>[];

    for (int i = 0; i < (data?.chartPoints?.length ?? 0); i++) {
      final point = data?.chartPoints?[i];

      studentSpots.add(
        FlSpot(
          i.toDouble(),
          (point?.studentScore ?? 0).clamp(0, 100).toDouble(),
        ),
      );

      averageSpots.add(
        FlSpot(
          i.toDouble(),
          (point?.averageStudentScore ?? 0).clamp(0, 100).toDouble(),
        ),
      );
    }

    return LineChartData(
      minX: 0,
      maxX: ((data?.chartPoints?.length ?? 0) - 1).toDouble(),
      minY: 0,
      maxY: 100,
      clipData: const FlClipData.all(),
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => const Color(0xFF1F4DB7),
          tooltipPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                spot.y.toInt().toString(),
                const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (_) {
          return const FlLine(color: Color(0xFFE5E7EB), strokeWidth: 1);
        },
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString().padLeft(3, '0'),
                style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 24,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();

              if (value != index.toDouble()) {
                return const SizedBox.shrink();
              }

              if (index < 0 || index >= (data?.chartPoints?.length ?? 0)) {
                return const SizedBox.shrink();
              }

              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  data?.chartPoints?[index].label ?? "",
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: studentSpots,
          isCurved: true,
          color: const Color(0xFF2F80ED),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: averageSpots,
          isCurved: true,
          color: const Color(0xFFBDBDBD),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }
}
