// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackQuestionResponse _$FeedbackQuestionResponseFromJson(
  Map<String, dynamic> json,
) => FeedbackQuestionResponse(
  success: json['success'] as bool?,
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$FeedbackQuestionResponseToJson(
  FeedbackQuestionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
};
