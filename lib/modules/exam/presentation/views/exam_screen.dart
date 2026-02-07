import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final _formKey = GlobalKey<FormState>();
  List<QuestionResult> _questionResults = [];
  final List<Question> _initialData = [
    Question(
      question:
          "The property of a conductor due to which it allows current to pass easily is called:",
      isMandatory: true,
      answerChoices: {
        "Conductivity": null,
        "Resistance": null,
        "Insulation": null,
        "Inductance": null,
      },
    ),

    Question(
      question: "Kirchhoff’s Current Law (KCL) is applicable to:",
      isMandatory: true,
      answerChoices: {
        "Closed loop in a network": null,
        "Electronic circuits only": null,
        "Junctions in a network": null,
        "Electric circuit": null,
      },
    ),

    Question(
      question: "Unit of electrical resistance is:",
      isMandatory: true,
      answerChoices: {"Ampere": null, "Volt": null, "Ohm": null, "Watt": null},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(showBackButton: true),
      body: Form(
        key: _formKey,
        child: Survey(
          onNext: (questionResults) {
            _questionResults = questionResults;
          },
          initialData: _initialData,
        ),
      ),
      // bottomNavigationBar: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     SizedBox(
      //       width: double.infinity,
      //       height: 56,
      //       child: TextButton(
      //         style: TextButton.styleFrom(
      //           foregroundColor: Colors.white,
      //           backgroundColor: Colors.cyanAccent, // Background Color
      //         ),
      //         child: const Text("Validate"),
      //         onPressed: () {
      //           if (_formKey.currentState!.validate()) {
      //             //do something
      //           }
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
