import 'package:flutter/material.dart';

class ExamBottomBar extends StatelessWidget {
  final bool hasPrevious;
  final bool hasNext;
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onJump;
  final VoidCallback onSubmit;

  const ExamBottomBar({
    super.key,
    required this.hasPrevious,
    required this.hasNext,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onPrevious,
    required this.onNext,
    required this.onJump,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: hasPrevious ? onPrevious : null,
              icon: const Icon(Icons.chevron_left),
              label: const Text('Previous'),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: onJump,
            child: Text('${currentIndex + 1}/$totalQuestions'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: hasNext
                ? ElevatedButton.icon(
                    onPressed: onNext,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('Next'),
                  )
                : ElevatedButton.icon(
                    onPressed: onSubmit,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Submit'),
                  ),
          ),
        ],
      ),
    );
  }
}
