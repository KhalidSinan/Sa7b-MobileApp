// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_and_unfollow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowAndUnfollowResponse _$FollowAndUnfollowResponseFromJson(
  Map<String, dynamic> json,
) => FollowAndUnfollowResponse(
  success: json['success'] as bool,
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$FollowAndUnfollowResponseToJson(
  FollowAndUnfollowResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
};
