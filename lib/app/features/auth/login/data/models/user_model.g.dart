// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
//   id: (json['id'] as num).toInt(),
//   first_name: json['first_name'] as String,
//   middle_name: json['middle_name'] as String?,
//   last_name: json['last_name'] as String,
//   bio: json['bio'] as String?,
//   phone_number: json['phone_number'] as String?,
//   image: json['image'] as String?,
//   linkedIn_account: json['linkedIn_account'] as String?,
//   facebook_account: json['facebook_account'] as String?,
//   github_account: json['github_account'] as String?,
//   x_account: json['x_account'] as String?,
//   user_id: (json['user_id'] as num).toInt(),
//   college_id: (json['college_id'] as num).toInt(),
//   created_at: json['created_at'] as String,
//   updated_at: json['updated_at'] as String,
// );

// Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'first_name': instance.first_name,
//       'middle_name': instance.middle_name,
//       'last_name': instance.last_name,
//       'bio': instance.bio,
//       'phone_number': instance.phone_number,
//       'image': instance.image,
//       'linkedIn_account': instance.linkedIn_account,
//       'facebook_account': instance.facebook_account,
//       'github_account': instance.github_account,
//       'x_account': instance.x_account,
//       'user_id': instance.user_id,
//       'college_id': instance.college_id,
//       'created_at': instance.created_at,
//       'updated_at': instance.updated_at,
//     };

// UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
//   id: (json['id'] as num).toInt(),
//   username: json['username'] as String,
//   email: json['email'] as String,
//   role: json['role'] as String,
//   created_at: json['created_at'] as String,
//   updated_at: json['updated_at'] as String,
//   student:
//       json['student'] == null
//           ? null
//           : StudentModel.fromJson(json['student'] as Map<String, dynamic>),
// );

// Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
//   'id': instance.id,
//   'username': instance.username,
//   'email': instance.email,
//   'role': instance.role,
//   'created_at': instance.created_at,
//   'updated_at': instance.updated_at,
//   'student': instance.student,
// };
