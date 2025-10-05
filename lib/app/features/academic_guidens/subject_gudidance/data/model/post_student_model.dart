import 'package:json_annotation/json_annotation.dart';

part 'post_student_model.g.dart';

@JsonSerializable()
class PostStudentModel {
  final int id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'middle_name')
  final String? middleName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String? bio;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  final String? image;

  @JsonKey(name: 'linkedIn_account')
  final String? linkedIn;

  @JsonKey(name: 'facebook_account')
  final String? facebook;

  @JsonKey(name: 'github_account')
  final String? github;

  @JsonKey(name: 'x_account')
  final String? x;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'college_id')
  final int collegeId;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  PostStudentModel({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.bio,
    this.phoneNumber,
    this.image,
    this.linkedIn,
    this.facebook,
    this.github,
    this.x,
    required this.userId,
    required this.collegeId,
    this.createdAt,
    this.updatedAt,
  });

  factory PostStudentModel.fromJson(Map<String, dynamic> json) =>
      _$PostStudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostStudentModelToJson(this);

  String get fullName =>
      "$firstName ${middleName ?? ""} $lastName".trim().isNotEmpty
          ? "$firstName ${middleName ?? ""} $lastName".trim()
          : "أنا";
}
