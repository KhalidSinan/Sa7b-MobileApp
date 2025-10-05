// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      bio: json['bio'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      image: json['image'] as String?,
      linkedInAccount: json['linkedInAccount'] as String?,
      facebookAccount: json['facebookAccount'] as String?,
      githubAccount: json['githubAccount'] as String?,
      xAccount: json['xAccount'] as String?,
      userId: (json['userId'] as num).toInt(),
      collegeId: (json['collegeId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'linkedInAccount': instance.linkedInAccount,
      'facebookAccount': instance.facebookAccount,
      'githubAccount': instance.githubAccount,
      'xAccount': instance.xAccount,
      'userId': instance.userId,
      'collegeId': instance.collegeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
