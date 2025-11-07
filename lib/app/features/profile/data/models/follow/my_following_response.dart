import 'package:json_annotation/json_annotation.dart';

part 'my_following_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyFollowingResponse {
  final bool? success;
  final int? status;
  final String? message;
  final List<FollowingUser>? data;

  MyFollowingResponse({this.success, this.status, this.message, this.data});

  factory MyFollowingResponse.fromJson(Map<String, dynamic> json) =>
      _$MyFollowingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyFollowingResponseToJson(this);
}

@JsonSerializable()
class FollowingUser {
  final int? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? bio;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? image;
  @JsonKey(name: 'linkedIn_account')
  final String? linkedInAccount;
  @JsonKey(name: 'facebook_account')
  final String? facebookAccount;
  @JsonKey(name: 'github_account')
  final String? githubAccount;
  @JsonKey(name: 'x_account')
  final String? xAccount;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'college_id')
  final int? collegeId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  FollowingUser({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.bio,
    this.phoneNumber,
    this.image,
    this.linkedInAccount,
    this.facebookAccount,
    this.githubAccount,
    this.xAccount,
    this.userId,
    this.collegeId,
    this.createdAt,
    this.updatedAt,
  });

  factory FollowingUser.fromJson(Map<String, dynamic> json) =>
      _$FollowingUserFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingUserToJson(this);
}
