import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../data/models/feedback_by_id_response.dart';
import '../data/models/feedback_question_request_body.dart';
import '../logic/feedback_question/feedback_question_cubit.dart';
import 'widgets/dynamic_question_card.dart';

class FeedbackQuestionsScreen extends StatefulWidget {
  final int feedbackId;
  const FeedbackQuestionsScreen({super.key, required this.feedbackId});

  @override
  State<FeedbackQuestionsScreen> createState() =>
      _FeedbackQuestionsScreenState();
}

class _FeedbackQuestionsScreenState extends State<FeedbackQuestionsScreen> {
  final Map<int, dynamic> _answers = {};

  void _handleAnswer(int id, dynamic answer) {
    _answers[id] = answer;
  }

  void _submit(
    BuildContext context,
    FeedbackQuestionCubit cubit,
    FeedbackData feedbackData,
  ) {
    final formKey = cubit.formKey;
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    final questions = feedbackData.questions;
    for (final q in questions!) {
      if (_answers[q.id] == null || _answers[q.id].toString().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("يرجى الإجابة على السؤال: ${q.questionText}"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    final feedbackAnswers =
        questions.map((q) {
          final answer = _answers[q.id];

          int numericAnswer;
          if (answer == "bad") {
            numericAnswer = 1;
          } else if (answer == "Good") {
            numericAnswer = 2;
          } else if (answer == "Excellent") {
            numericAnswer = 3;
          } else {
            numericAnswer = 0;
          }

          return FeedbackAnswer(questionId: q.id!, answer: numericAnswer);
        }).toList();

    cubit.feedbackQuestion(
      title: questions.map((e) => e.questionText).toString(),
      feedbackAnswers: feedbackAnswers,
      feedbackId: widget.feedbackId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FeedbackQuestionCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('استبيان الامتحان')),
      body: BlocConsumer<FeedbackQuestionCubit, FeedbackQuestionState>(
        listener: (context, state) {
          state.maybeWhen(
            successSubmitQuestion: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تم إرسال الإجابات بنجاح")),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            error: (message) => Center(child: Text(message)),
            successGetFeedbackById: (feedbackResponse) {
              final feedbackData = feedbackResponse.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Text(
                        feedbackData.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...feedbackData.questions!.map(
                        (q) => DynamicQuestionCard(
                          questionText: q.questionText!,
                          questionId: q.id!,
                          onAnswerChanged: _handleAnswer,
                          options: ["bad", "Good", "Excellent"],
                          type: "radio",
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                        onPressed: () => _submit(context, cubit, feedbackData),
                        text: 'إرسال',
                      ),
                    ],
                  ),
                ),
              );
            },
            successSubmitQuestion:
                (_) => const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 80,
                  ),
                ),
          );
        },
      ),
    );
  }
}
