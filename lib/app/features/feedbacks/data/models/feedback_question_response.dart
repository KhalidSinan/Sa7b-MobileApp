import 'package:json_annotation/json_annotation.dart';
part 'feedback_question_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackQuestionResponse {
  final bool? success;
  final int? status;
  final String? message;

  FeedbackQuestionResponse({this.success, this.status, this.message});

  factory FeedbackQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackQuestionResponseToJson(this);
}
