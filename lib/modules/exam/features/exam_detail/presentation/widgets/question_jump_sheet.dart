import 'package:flutter/material.dart';

class QuestionJumpSheet extends StatelessWidget {
  final int totalQuestions;
  final int currentIndex;
  final bool Function(int index) isAnswered;
  final void Function(int index) onTap;

  const QuestionJumpSheet({
    super.key,
    required this.totalQuestions,
    required this.currentIndex,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jump to question', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Green = answered, Red = not answered'),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              itemCount: totalQuestions,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final answered = isAnswered(index);
                final isCurrent = index == currentIndex;
                return InkWell(
                  onTap: () => onTap(index),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: answered ? Colors.green : Colors.red,
                        width: isCurrent ? 3 : 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
