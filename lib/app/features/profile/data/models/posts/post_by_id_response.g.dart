// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostByIdResponse _$PostByIdResponseFromJson(Map<String, dynamic> json) =>
    PostByIdResponse(
      json['success'] as bool?,
      (json['status'] as num?)?.toInt(),
      json['message'] as String?,
      json['data'] == null
          ? null
          : PostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostByIdResponseToJson(PostByIdResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
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

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'visibility': instance.visibility,
  'student_name': instance.studentName,
  'files': instance.files,
};
