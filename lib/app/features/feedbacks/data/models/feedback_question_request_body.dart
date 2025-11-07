import 'package:json_annotation/json_annotation.dart';

part 'feedback_question_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackQuestionRequestBody {
  final String content;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'feedback_answers')
  final List<FeedbackAnswer> feedbackAnswers;

  FeedbackQuestionRequestBody({
    required this.content,
    required this.userId,
    required this.feedbackAnswers,
  });

  factory FeedbackQuestionRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FeedbackQuestionRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackQuestionRequestBodyToJson(this);
}

@JsonSerializable()
class FeedbackAnswer {
  @JsonKey(name: 'question_id')
  final int questionId;

  final int answer;

  FeedbackAnswer({
    required this.questionId,
    required this.answer,
  });

  factory FeedbackAnswer.fromJson(Map<String, dynamic> json) =>
      _$FeedbackAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackAnswerToJson(this);
}
