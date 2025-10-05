// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostStudentModel _$PostStudentModelFromJson(Map<String, dynamic> json) =>
    PostStudentModel(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String,
      bio: json['bio'] as String?,
      phoneNumber: json['phone_number'] as String?,
      image: json['image'] as String?,
      linkedIn: json['linkedIn_account'] as String?,
      facebook: json['facebook_account'] as String?,
      github: json['github_account'] as String?,
      x: json['x_account'] as String?,
      userId: (json['user_id'] as num).toInt(),
      collegeId: (json['college_id'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PostStudentModelToJson(PostStudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'bio': instance.bio,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'linkedIn_account': instance.linkedIn,
      'facebook_account': instance.facebook,
      'github_account': instance.github,
      'x_account': instance.x,
      'user_id': instance.userId,
      'college_id': instance.collegeId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
