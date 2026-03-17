import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

class DashboardExamScreen extends StatelessWidget {
  const DashboardExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExamListView(argument: ExamScreenArgument.all());
  }
}
