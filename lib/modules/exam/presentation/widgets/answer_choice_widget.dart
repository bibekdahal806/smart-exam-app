import 'package:flutter/material.dart';
import 'package:q_bank/modules/exam/exam.dart';

class AnswerChoiceWidget extends StatefulWidget {
  /// Emits new value (optionIds or typed text).
  final void Function(List<String> answers) onChange;

  /// The question to render.
  final QuestionEntity question;

  /// Current value for this question.
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

  String _optionId(OptionEntity opt) {
    // Prefer backend id. If missing, fall back to text (not ideal but avoids crash).
    return (opt.id ?? opt.text ?? '').trim();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.question.type) {
      case QuestionType.text:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _textController,
            onChanged: (value) => widget.onChange([value]),
          ),
        );

      case QuestionType.single:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.question.options.map((opt) {
            final id = _optionId(opt);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Radio<String>(
                    value: id,
                    groupValue: _selectedId,
                    onChanged: (v) {
                      setState(() => _selectedId = v);
                      if (v != null) widget.onChange([v]);
                    },
                  ),
                  Flexible(child: Text(opt.text ?? '-')),
                ],
              ),
            );
          }).toList(),
        );

      case QuestionType.multi:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.question.options.map((opt) {
            final id = _optionId(opt);
            final checked = _multiSelected.contains(id);

            return Row(
              children: [
                Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        if (!_multiSelected.contains(id))
                          _multiSelected.add(id);
                      } else {
                        _multiSelected.remove(id);
                      }
                    });
                    widget.onChange([..._multiSelected]);
                  },
                ),
                Flexible(child: Text(opt.text ?? '-')),
              ],
            );
          }).toList(),
        );
    }
  }
}
