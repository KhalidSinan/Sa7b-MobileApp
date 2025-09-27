import 'package:flutter/material.dart';
import 'package:sa7b/app/features/feedback_questions/data/models/feedback_questions_data.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';
import 'widgets/dynamic_question_card.dart';



class FeedbackQuestionsScreen extends StatefulWidget {
  const FeedbackQuestionsScreen({super.key});

  @override
  State<FeedbackQuestionsScreen> createState() => _FeedbackQuestionsScreenState();
}

class _FeedbackQuestionsScreenState extends State<FeedbackQuestionsScreen> {
  final Map<String, dynamic> _answers = {};

  void _handleAnswer(String id, dynamic answer) {
    _answers[id] = answer;
  }

  void _submit() {
    for (var q in fakeQuestions) {
      if (q.isRequired && (_answers[q.id] == null || _answers[q.id].toString().isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("يرجى الإجابة على السؤال: ${q.question}"),
          backgroundColor: Colors.red,
        ));
        return;
      }
    }

    print("Answers:");
    _answers.forEach((key, value) {
      print("$key: $value");
    });

    // TODO: send to backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('استبيان الامتحان'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...fakeQuestions.map((q) => DynamicQuestionCard(
              question: q,
              onAnswerChanged: _handleAnswer,
            )),
            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: _submit,
              text: 'ارسال',
            )
          ],
        ),
      ),
    );
  }
}
