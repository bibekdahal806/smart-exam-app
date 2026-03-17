import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class PerformanceChartCard extends StatelessWidget {
  final PerformanceOvertimeEntity data;

  const PerformanceChartCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 220,
            child: CustomPaint(
              size: const Size(double.infinity, 220),
              painter: _PerformanceChartPainter(data.chartPoints),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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

class _PerformanceChartPainter extends CustomPainter {
  final List<ChartPointEntity> points;

  _PerformanceChartPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    const double leftPadding = 34;
    const double bottomPadding = 28;
    const double topPadding = 8;
    final double chartWidth = size.width - leftPadding;
    final double chartHeight = size.height - bottomPadding - topPadding;

    final axisPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 1;

    final textStyle = const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10);
    const labels = ['000', '020', '040', '060', '080', '100'];

    for (int i = 0; i < labels.length; i++) {
      final y = topPadding + (chartHeight / (labels.length - 1)) * i;
      canvas.drawLine(Offset(leftPadding, y), Offset(size.width, y), axisPaint);
      final painter = TextPainter(
        text: TextSpan(text: labels[labels.length - 1 - i], style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      painter.paint(canvas, Offset(0, y - 6));
    }

    final blueOffsets = _mapOffsets(
      values: points.map((e) => e.studentScore).toList(),
      labels: points.map((e) => e.label).toList(),
      leftPadding: leftPadding,
      topPadding: topPadding,
      chartWidth: chartWidth,
      chartHeight: chartHeight,
      size: size,
      canvas: canvas,
      textStyle: textStyle,
    );

    final greyOffsets = _mapOffsets(
      values: points.map((e) => e.averageStudentScore).toList(),
      labels: points.map((e) => e.label).toList(),
      leftPadding: leftPadding,
      topPadding: topPadding,
      chartWidth: chartWidth,
      chartHeight: chartHeight,
      size: size,
      canvas: canvas,
      textStyle: textStyle,
      drawLabels: false,
    );

    _drawSmoothLine(canvas, greyOffsets, const Color(0xFFBDBDBD));
    _drawSmoothLine(canvas, blueOffsets, const Color(0xFF2F80ED));

    final highestBluePoint = blueOffsets.reduce((a, b) => a.dy < b.dy ? a : b);
    final originalPoint = points[blueOffsets.indexOf(highestBluePoint)];
    _drawTooltip(
      canvas,
      highestBluePoint,
      originalPoint.studentScore.toInt().toString(),
    );
  }

  List<Offset> _mapOffsets({
    required List<double> values,
    required List<String> labels,
    required double leftPadding,
    required double topPadding,
    required double chartWidth,
    required double chartHeight,
    required Size size,
    required Canvas canvas,
    required TextStyle textStyle,
    bool drawLabels = true,
  }) {
    final List<Offset> offsets = [];
    final stepX = labels.length == 1
        ? chartWidth
        : chartWidth / (labels.length - 1);

    for (int i = 0; i < values.length; i++) {
      final x = leftPadding + (stepX * i);
      final y =
          topPadding +
          chartHeight -
          ((values[i].clamp(0, 100) / 100) * chartHeight);
      offsets.add(Offset(x, y));

      if (drawLabels) {
        final painter = TextPainter(
          text: TextSpan(text: labels[i], style: textStyle),
          textDirection: TextDirection.ltr,
        )..layout();
        painter.paint(
          canvas,
          Offset(x - (painter.width / 2), size.height - 18),
        );
      }
    }

    return offsets;
  }

  void _drawSmoothLine(Canvas canvas, List<Offset> offsets, Color color) {
    if (offsets.length < 2) return;

    final path = Path()..moveTo(offsets.first.dx, offsets.first.dy);
    for (int i = 0; i < offsets.length - 1; i++) {
      final current = offsets[i];
      final next = offsets[i + 1];
      final controlPoint1 = Offset((current.dx + next.dx) / 2, current.dy);
      final controlPoint2 = Offset((current.dx + next.dx) / 2, next.dy);
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        next.dx,
        next.dy,
      );
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3;

    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = color;
    for (final offset in offsets) {
      canvas.drawCircle(offset, 3.5, dotPaint);
    }
  }

  void _drawTooltip(Canvas canvas, Offset point, String value) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(point.dx, point.dy - 22),
        width: 34,
        height: 22,
      ),
      const Radius.circular(6),
    );

    final bgPaint = Paint()..color = const Color(0xFF1F4DB7);
    canvas.drawRRect(rect, bgPaint);

    final tp = TextPainter(
      text: TextSpan(
        text: value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(
      canvas,
      Offset(rect.center.dx - tp.width / 2, rect.center.dy - tp.height / 2),
    );

    final triangle = Path()
      ..moveTo(point.dx - 5, point.dy - 12)
      ..lineTo(point.dx + 5, point.dy - 12)
      ..lineTo(point.dx, point.dy - 6)
      ..close();
    canvas.drawPath(triangle, bgPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
