import 'package:flutter/material.dart';
import 'package:sa7b/app/features/feedback_questions/data/models/feedback_question.dart';

class DynamicQuestionCard extends StatefulWidget {
  final FeedbackQuestion question;
  final void Function(String id, dynamic answer) onAnswerChanged;

  const DynamicQuestionCard({
    super.key,
    required this.question,
    required this.onAnswerChanged,
  });

  @override
  State<DynamicQuestionCard> createState() => _DynamicQuestionCardState();
}

class _DynamicQuestionCardState extends State<DynamicQuestionCard> {
  TextEditingController? _controller;
  String? _selectedRadio;
  final List<String> _selectedCheckboxes = [];

  @override
  void initState() {
    super.initState();
    if (widget.question.type == QuestionType.text) {
      _controller = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.withOpacity(0.2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: q.question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
              children: q.isRequired
                  ? [TextSpan(text: ' *', style: TextStyle(color: Colors.red),)]
                  : [],
            ),
          ),
          const SizedBox(height: 12),
          _buildAnswerInput(q),
        ],
      ),
    );
  }

  Widget _buildAnswerInput(FeedbackQuestion q) {
    switch (q.type) {
      case QuestionType.text:
        return TextField(
          controller: _controller,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'اكتب إجابتك هنا',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => widget.onAnswerChanged(q.id, value),
        );
      case QuestionType.radio:
        return Column(
          children: q.options!.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: _selectedRadio,
              onChanged: (value) {
                setState(() => _selectedRadio = value);
                widget.onAnswerChanged(q.id, value);
              },
            );
          }).toList(),
        );
      case QuestionType.checkbox:
        return Column(
          children: q.options!.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: _selectedCheckboxes.contains(option),
              onChanged: (checked) {
                setState(() {
                  checked!
                      ? _selectedCheckboxes.add(option)
                      : _selectedCheckboxes.remove(option);
                });
                widget.onAnswerChanged(q.id, _selectedCheckboxes);
              },
            );
          }).toList(),
        );
    }
  }
}
