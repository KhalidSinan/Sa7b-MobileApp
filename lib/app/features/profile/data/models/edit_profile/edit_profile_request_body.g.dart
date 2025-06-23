// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestBody(
  firstName: json['first_name'] as String,
  middleName: json['middle_name'] as String?,
  lastName: json['last_name'] as String,
  academicYear: json['academic_year'] as String,
  bio: json['bio'] as String?,
  linkedinAccount: json['linkedln_account'] as String?,
  facebookAccount: json['facebook_account'] as String?,
  githubAccount: json['github_account'] as String?,
  xAccount: json['x_account'] as String?,
  phoneNumber: json['phone_number'] as String,
);

Map<String, dynamic> _$EditProfileRequestBodyToJson(
  EditProfileRequestBody instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'middle_name': instance.middleName,
  'last_name': instance.lastName,
  'academic_year': instance.academicYear,
  'bio': instance.bio,
  'linkedln_account': instance.linkedinAccount,
  'facebook_account': instance.facebookAccount,
  'github_account': instance.githubAccount,
  'x_account': instance.xAccount,
  'phone_number': instance.phoneNumber,
};
