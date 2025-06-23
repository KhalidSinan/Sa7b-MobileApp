// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFile _$PostFileFromJson(Map<String, dynamic> json) => PostFile(
  id: (json['id'] as num).toInt(),
  file: json['file'] as String,
  postId: (json['post_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$PostFileToJson(PostFile instance) => <String, dynamic>{
  'id': instance.id,
  'file': instance.file,
  'post_id': instance.postId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
