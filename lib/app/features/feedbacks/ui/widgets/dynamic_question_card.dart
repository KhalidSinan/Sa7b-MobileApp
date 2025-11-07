import 'package:flutter/material.dart';

class DynamicQuestionCard extends StatefulWidget {
  final String questionText;
  final int questionId;
  final List<String>? options;
  final bool isRequired;
  final String? type; // "text", "radio", "checkbox"
  final void Function(int id, dynamic answer) onAnswerChanged;

  const DynamicQuestionCard({
    super.key,
    required this.questionText,
    required this.questionId,
    this.options,
    this.type = "text",
    this.isRequired = false,
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
    if (widget.type == "text") {
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.grey.withOpacity(0.2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.questionText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              children:
                  widget.isRequired
                      ? const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ]
                      : [],
            ),
          ),
          const SizedBox(height: 12),
          _buildAnswerInput(),
        ],
      ),
    );
  }

  Widget _buildAnswerInput() {
    switch (widget.type) {
      case "text":
        return TextField(
          controller: _controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'اكتب إجابتك هنا',
            border: OutlineInputBorder(),
          ),
          onChanged:
              (value) => widget.onAnswerChanged(widget.questionId, value),
        );

      case "radio":
        return Column(
          children:
              widget.options!.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() => _selectedRadio = value);
                    widget.onAnswerChanged(widget.questionId, value);
                  },
                );
              }).toList(),
        );

      case "checkbox":
        return Column(
          children:
              widget.options!.map((option) {
                return CheckboxListTile(
                  title: Text(option),
                  value: _selectedCheckboxes.contains(option),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _selectedCheckboxes.add(option);
                      } else {
                        _selectedCheckboxes.remove(option);
                      }
                    });
                    widget.onAnswerChanged(
                      widget.questionId,
                      List.from(_selectedCheckboxes),
                    );
                  },
                );
              }).toList(),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
