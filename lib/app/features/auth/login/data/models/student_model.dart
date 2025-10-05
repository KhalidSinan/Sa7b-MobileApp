import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? bio;
  final String? phoneNumber;
  final String? image;
  final String? linkedInAccount;
  final String? facebookAccount;
  final String? githubAccount;
  final String? xAccount;
  final int userId;
  final int collegeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentModel({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.bio,
    this.phoneNumber,
    this.image,
    this.linkedInAccount,
    this.facebookAccount,
    this.githubAccount,
    this.xAccount,
    required this.userId,
    required this.collegeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}
