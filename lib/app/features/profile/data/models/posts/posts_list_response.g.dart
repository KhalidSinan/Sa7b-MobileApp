// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsListResponse _$PostsListResponseFromJson(Map<String, dynamic> json) =>
    PostsListResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PostsListResponseToJson(PostsListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  visibility: json['visibility'] as String,
  studentName: json['student_name'] as String,
  files:
      (json['files'] as List<dynamic>)
          .map((e) => PostFile.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'visibility': instance.visibility,
  'student_name': instance.studentName,
  'files': instance.files,
};
