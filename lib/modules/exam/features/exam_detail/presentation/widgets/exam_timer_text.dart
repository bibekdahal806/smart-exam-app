import 'package:flutter/material.dart';

class ExamTimerText extends StatelessWidget {
  final int remainingSeconds;

  const ExamTimerText({super.key, required this.remainingSeconds});

  String _format(int seconds) {
    if (seconds < 0) return 'Unlimited';
    final d = Duration(seconds: seconds);
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final isCritical = remainingSeconds >= 0 && remainingSeconds <= 60;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_outlined, color: isCritical ? Colors.red : null),
        const SizedBox(width: 6),
        Text(
          _format(remainingSeconds),
          style: TextStyle(fontWeight: FontWeight.w700, color: isCritical ? Colors.red : null),
        ),
      ],
    );
  }
}
