// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_question_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackQuestionRequestBody _$FeedbackQuestionRequestBodyFromJson(
  Map<String, dynamic> json,
) => FeedbackQuestionRequestBody(
  content: json['content'] as String,
  userId: (json['user_id'] as num).toInt(),
  feedbackAnswers:
      (json['feedback_answers'] as List<dynamic>)
          .map((e) => FeedbackAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FeedbackQuestionRequestBodyToJson(
  FeedbackQuestionRequestBody instance,
) => <String, dynamic>{
  'content': instance.content,
  'user_id': instance.userId,
  'feedback_answers': instance.feedbackAnswers.map((e) => e.toJson()).toList(),
};

FeedbackAnswer _$FeedbackAnswerFromJson(Map<String, dynamic> json) =>
    FeedbackAnswer(
      questionId: (json['question_id'] as num).toInt(),
      answer: (json['answer'] as num).toInt(),
    );

Map<String, dynamic> _$FeedbackAnswerToJson(FeedbackAnswer instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'answer': instance.answer,
    };
