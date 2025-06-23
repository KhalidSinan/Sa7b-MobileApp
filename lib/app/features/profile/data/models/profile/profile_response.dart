import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final bool? success;
  final int? status;
  final String? message;
  @JsonKey(name: 'data')
  final UserData userData;

  ProfileResponse({
    this.success,
    this.status,
    this.message,
    required this.userData,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String username;
  final String bio;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? image;
  @JsonKey(name: 'college_name')
  final String collegeName;
  @JsonKey(name: 'linkedIn_account')
  final String linkedInAccount;
  @JsonKey(name: 'facebook_account')
  final String facebookAccount;
  @JsonKey(name: 'github_account')
  final String githubAccount;
  @JsonKey(name: 'x_account')
  final String xAccount;
  final List<Skill> skills;
  @JsonKey(name: 'academic_year')
  final AcademicYear? academicYear;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  UserData({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.username,
    required this.bio,
    required this.phoneNumber,
    this.image,
    required this.collegeName,
    required this.linkedInAccount,
    required this.facebookAccount,
    required this.githubAccount,
    required this.xAccount,
    required this.skills,
    this.academicYear,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@JsonSerializable()
class Skill {
  final int id;
  final String skill;
  @JsonKey(name: 'student_id')
  final int studentId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Skill({
    required this.id,
    required this.skill,
    required this.studentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

@JsonSerializable()
class AcademicYear {
  final int id;
  final String year;
  @JsonKey(name: 'college_id')
  final int collegeId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  AcademicYear({
    required this.id,
    required this.year,
    required this.collegeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearFromJson(json);
}
