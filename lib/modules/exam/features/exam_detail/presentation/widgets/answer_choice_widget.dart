import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/exam/exam.dart';

class AnswerChoiceWidget extends StatefulWidget {
  final void Function(List<String> answers) onChange;
  final QuestionEntity question;
  final List<String> value;

  const AnswerChoiceWidget({
    super.key,
    required this.question,
    required this.onChange,
    required this.value,
  });

  @override
  State<AnswerChoiceWidget> createState() => _AnswerChoiceWidgetState();
}

class _AnswerChoiceWidgetState extends State<AnswerChoiceWidget> {
  late final TextEditingController _textController;
  String? _selectedId;
  late List<String> _multiSelected;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: widget.value.isNotEmpty ? widget.value.first : '',
    );
    _selectedId = widget.value.isNotEmpty ? widget.value.first : null;
    _multiSelected = [...widget.value];
  }

  @override
  void didUpdateWidget(covariant AnswerChoiceWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.question.type == QuestionType.text) {
        _textController.text = widget.value.isNotEmpty
            ? widget.value.first
            : '';
      } else if (widget.question.type == QuestionType.single) {
        _selectedId = widget.value.isNotEmpty ? widget.value.first : null;
      } else {
        _multiSelected = [...widget.value];
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  String _optionId(OptionEntity opt) => (opt.id ?? opt.text ?? '').trim();

  @override
  Widget build(BuildContext context) {
    switch (widget.question.type) {
      case QuestionType.text:
        return CustomOutlinedTextField(
          controller: _textController,
          maxLines: 4,
          hint: 'Type your answer',
          textInputAction: .done,
          onValueChange: (value) => widget.onChange([value]),
        );
      case QuestionType.single:
        return Column(
          children: widget.question.options.map((opt) {
            final id = _optionId(opt);
            return RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              value: id,
              groupValue: _selectedId,
              title: Text(opt.text ?? '-'),
              onChanged: (v) {
                setState(() => _selectedId = v);
                if (v != null) widget.onChange([v]);
              },
            );
          }).toList(),
        );
      case QuestionType.multi:
        return Column(
          children: widget.question.options.map((opt) {
            final id = _optionId(opt);
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: _multiSelected.contains(id),
              title: Text(opt.text ?? '-'),
              onChanged: (checked) {
                setState(() {
                  if (checked == true) {
                    if (!_multiSelected.contains(id)) _multiSelected.add(id);
                  } else {
                    _multiSelected.remove(id);
                  }
                });
                widget.onChange([..._multiSelected]);
              },
            );
          }).toList(),
        );
    }
  }
}
