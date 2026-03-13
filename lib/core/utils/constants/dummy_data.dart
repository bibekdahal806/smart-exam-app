import 'package:q_bank/modules/exam/exam.dart';

var examDummyData = ExamMapper.fromJsonToEntity({
  "id": "exam_123",
  "createdAt": "2026-02-28T14:10:00Z",
  "questions": [
    {
      "id": "q1",
      "text": "What is Flutter?",
      "type": "single",
      "isMandatory": true,
      "options": [
        {"id": "o1", "text": "SDK"},
        {"id": "o2", "text": "Database"},
      ],
    },
    {
      "id": "q2",
      "text": "Select state management tools you used",
      "type": "multi",
      "isMandatory": false,
      "options": [
        {"id": "o10", "text": "Bloc"},
        {"id": "o11", "text": "Provider"},
      ],
    },
    {
      "id": "q3",
      "text": "Explain async/await",
      "type": "text",
      "isMandatory": true,
      "options": [],
    },
  ],
});


// {
//   "examId": "exam_123",
//   "answers": [
//     { "questionId": "q1", "answers": ["o2"] },
//     { "questionId": "q2", "answers": ["o10", "o11"] },
//     { "questionId": "q3", "answers": ["Async/await explanation..."] }
//   ]
// }