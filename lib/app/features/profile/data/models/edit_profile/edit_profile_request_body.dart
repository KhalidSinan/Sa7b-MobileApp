import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? image;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'middle_name')
  final String? middleName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<String>? skills;

  @JsonKey(name: 'academic_year')
  final String academicYear;

  final String? bio;

  @JsonKey(name: 'linkedln_account')
  final String? linkedinAccount;

  @JsonKey(name: 'facebook_account')
  final String? facebookAccount;

  @JsonKey(name: 'github_account')
  final String? githubAccount;

  @JsonKey(name: 'x_account')
  final String? xAccount;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  EditProfileRequestBody({
    this.image,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.skills,
    required this.academicYear,
    this.bio,
    this.linkedinAccount,
    this.facebookAccount,
    this.githubAccount,
    this.xAccount,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}
