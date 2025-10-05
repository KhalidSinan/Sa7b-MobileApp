import 'package:sa7b/app/features/auth/login/data/models/student_model.dart';

class UserModel {
  final int? id;
  final String? username;
  final String? email;
  final String? role;
  final StudentModel? student;
  final String accessToken;
  final String? tokenType;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.role,
    this.student,
    required this.accessToken,
    this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? json['user']?['id'],
      username: json['username'] ?? json['user']?['username'],
      email: json['email'] ?? json['user']?['email'],
      role: json['role'] ?? json['user']?['role'],
      student: json['student'] != null
          ? StudentModel.fromJson(json['student'])
          : (json['user']?['student'] != null
              ? StudentModel.fromJson(json['user']['student'])
              : null),
      accessToken: json['token'],
      tokenType: json['token_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'role': role,
      'token': accessToken,
      'token_type': tokenType,
    };
  }
}
