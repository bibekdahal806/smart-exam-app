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

  int _crossAxisCount(double width) {
    if (width < 320) return 4;
    if (width < 480) return 5;
    return 6;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: screenHeight * 0.72),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = _crossAxisCount(constraints.maxWidth);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jump to question',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Green = answered, Red = not answered',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: totalQuestions,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
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
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: answered ? Colors.green : Colors.red,
                                width: isCurrent ? 3 : 1.5,
                              ),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
