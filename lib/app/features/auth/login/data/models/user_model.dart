import 'package:json_annotation/json_annotation.dart';
import 'student_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? username;
  final String? email;
  final String? role;
  final StudentModel? student;
  final String accessToken;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.role,
    this.student,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
