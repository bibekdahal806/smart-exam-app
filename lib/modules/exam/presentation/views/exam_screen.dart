import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamScreen extends StatelessWidget {
  final ExamScreenArgument argument;
  const ExamScreen({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoadExamsCubit>(
      create: (_) => LoadExamsCubit()..loadExams(argument),
      child: ExamListView(argument: argument),
    );
  }
}
