// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  middleName: json['middle_name'] as String,
  lastName: json['last_name'] as String,
  username: json['username'] as String,
  bio: json['bio'] as String,
  phoneNumber: json['phone_number'] as String,
  image: json['image'] as String?,
  collegeName: json['college_name'] as String,
  linkedInAccount: json['linkedIn_account'] as String,
  facebookAccount: json['facebook_account'] as String,
  githubAccount: json['github_account'] as String,
  xAccount: json['x_account'] as String,
  skills:
      (json['skills'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
  academicYear:
      json['academic_year'] == null
          ? null
          : AcademicYear.fromJson(
            json['academic_year'] as Map<String, dynamic>,
          ),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'middle_name': instance.middleName,
  'last_name': instance.lastName,
  'username': instance.username,
  'bio': instance.bio,
  'phone_number': instance.phoneNumber,
  'image': instance.image,
  'college_name': instance.collegeName,
  'linkedIn_account': instance.linkedInAccount,
  'facebook_account': instance.facebookAccount,
  'github_account': instance.githubAccount,
  'x_account': instance.xAccount,
  'skills': instance.skills,
  'academic_year': instance.academicYear,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
  id: (json['id'] as num).toInt(),
  skill: json['skill'] as String,
  studentId: (json['student_id'] as num).toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
  'id': instance.id,
  'skill': instance.skill,
  'student_id': instance.studentId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

AcademicYear _$AcademicYearFromJson(Map<String, dynamic> json) => AcademicYear(
  id: (json['id'] as num).toInt(),
  year: json['year'] as String,
  collegeId: (json['college_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$AcademicYearToJson(AcademicYear instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'college_id': instance.collegeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
