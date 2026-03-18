import 'package:flutter/material.dart';
import 'package:q_bank/modules/home/home.dart';

class SubjectwiseStrengthCard extends StatelessWidget {
  final List<SubjectwiseStrengthEntity> subjects;

  const SubjectwiseStrengthCard({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
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
            Text(
              'Subjectwise Strength',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Subject',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Attempted',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Avg Score',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(subjects.length, (index) {
              final subject = subjects[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            subject.subjectName ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            subject.examAttempted.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${subject.averageScore?.toStringAsFixed(0)}%',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: _scoreColor(subject.averageScore ?? 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index != subjects.length - 1)
                    Divider(height: 1, color: Colors.grey.shade200),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _scoreColor(int score) {
    if (score >= 80) return const Color(0xFF27AE60);
    if (score >= 50) return const Color(0xFFF2994A);
    return const Color(0xFFEB5757);
  }
}
