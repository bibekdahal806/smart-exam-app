// import 'package:flutter/material.dart';
// import 'package:q_bank/common/common.dart';
// import 'package:q_bank/core/core.dart';
// import 'package:q_bank/modules/exam/exam.dart';

// class ExamScreen extends StatefulWidget {
//   const ExamScreen({super.key});

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }

// class _ExamScreenState extends State<ExamScreen> {
//   final _formKey = GlobalKey<FormState>();

//   List<QuestionResultEntity> _latestResults = const [];

//   // Demo data (in real app, build this from backend using ExamMapper.fromJsonToEntity)
//   late final ExamEntity _exam = ExamEntity(
//     id: 'exam_1',
//     createdAt: DateTime.now(),
//     questions: const [
//       QuestionEntity(
//         id: 'q_name',
//         text: 'What is your Name?',
//         type: QuestionType.text,
//       ),
//       QuestionEntity(
//         id: 'q_cond',
//         text:
//             'The property of a conductor due to which it allows current to pass easily is called:',
//         type: QuestionType.single,
//         options: [
//           OptionEntity(id: 'conductivity', text: 'Conductivity'),
//           OptionEntity(id: 'resistance', text: 'Resistance'),
//           OptionEntity(id: 'insulation', text: 'Insulation'),
//           OptionEntity(id: 'inductance', text: 'Inductance'),
//         ],
//       ),
//       QuestionEntity(
//         id: 'q_res_unit',
//         text: 'Unit of electrical resistance is:',
//         type: QuestionType.multi,
//         options: [
//           OptionEntity(id: 'ampere', text: 'Ampere'),
//           OptionEntity(id: 'volt', text: 'Volt'),
//           OptionEntity(id: 'ohm', text: 'Ohm'),
//           OptionEntity(id: 'watt', text: 'Watt'),
//         ],
//       ),
//     ],
//   );

//   void _submit() {
//     final isValid = _formKey.currentState?.validate() ?? false;
//     if (!isValid) return;

//     // Convert to JSON for backend submission
//     final payload = {
//       'exam_id': _exam.id,
//       'answers': QuestionResultMapper.toJsonListFromEntityList(_latestResults),
//     };

//     debugPrint('SUBMIT PAYLOAD => $payload');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             ParentTextWidget(
//               '2/50',
//               style: context.textTheme.bodyLarge?.copyWith(
//                 fontWeight: AppFontWeight.medium,
//                 color: context.customTheme.textPrimary,
//               ),
//             ),
//             Expanded(
//               child: Center(
//                 child: ParentTextWidget(
//                   '3:02:02',
//                   style: context.textTheme.bodyLarge?.copyWith(
//                     fontWeight: AppFontWeight.medium,
//                     color: context.customTheme.textPrimary,
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(onPressed: () {}, icon: const Icon(Icons.close_rounded)),
//           ],
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Survey(
//           exam: _exam,
//           onChange: (results) {
//             _latestResults = results;
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         elevation: 1,
//         onPressed: _submit,
//         label: const Text('Submit'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ParentTextWidget("Exam")),
    );
  }
}
