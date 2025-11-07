// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_following_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFollowingResponse _$MyFollowingResponseFromJson(Map<String, dynamic> json) =>
    MyFollowingResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => FollowingUser.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MyFollowingResponseToJson(
  MyFollowingResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.map((e) => e.toJson()).toList(),
};

FollowingUser _$FollowingUserFromJson(Map<String, dynamic> json) =>
    FollowingUser(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phone_number'] as String?,
      image: json['image'] as String?,
      linkedInAccount: json['linkedIn_account'] as String?,
      facebookAccount: json['facebook_account'] as String?,
      githubAccount: json['github_account'] as String?,
      xAccount: json['x_account'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      collegeId: (json['college_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FollowingUserToJson(FollowingUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'bio': instance.bio,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'linkedIn_account': instance.linkedInAccount,
      'facebook_account': instance.facebookAccount,
      'github_account': instance.githubAccount,
      'x_account': instance.xAccount,
      'user_id': instance.userId,
      'college_id': instance.collegeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
