enum QuestionType { text, checkbox, radio }

class FeedbackQuestion {
  final String id;
  final String question;
  final QuestionType type;
  final List<String>? options; // for checkbox and radio
  final bool isRequired;

  FeedbackQuestion({
    required this.id,
    required this.question,
    required this.type,
    this.options,
    this.isRequired = false,
  });
}
