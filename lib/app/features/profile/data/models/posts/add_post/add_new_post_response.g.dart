// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewPostResponse _$AddNewPostResponseFromJson(Map<String, dynamic> json) =>
    AddNewPostResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : AddPostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddNewPostResponseToJson(AddNewPostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AddPostData _$AddPostDataFromJson(Map<String, dynamic> json) => AddPostData(
  title: json['title'] as String,
  description: json['description'] as String,
  visibility: json['visibility'] as String,
  studentId: (json['student_id'] as num).toInt(),
  updatedAt: json['updated_at'] as String,
  createdAt: json['created_at'] as String,
  id: (json['id'] as num).toInt(),
  files:
      (json['files'] as List<dynamic>)
          .map((e) => CreatedFile.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AddPostDataToJson(AddPostData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'visibility': instance.visibility,
      'student_id': instance.studentId,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'files': instance.files,
    };

CreatedFile _$CreatedFileFromJson(Map<String, dynamic> json) => CreatedFile(
  id: (json['id'] as num).toInt(),
  file: json['file'] as String,
  postId: (json['post_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$CreatedFileToJson(CreatedFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'post_id': instance.postId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
