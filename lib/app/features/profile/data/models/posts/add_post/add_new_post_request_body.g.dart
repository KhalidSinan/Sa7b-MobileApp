// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_post_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewPostRequestBody _$AddNewPostRequestBodyFromJson(
  Map<String, dynamic> json,
) => AddNewPostRequestBody(
  title: json['title'] as String,
  description: json['description'] as String,
  visibility: json['visibility'] as String,
);

Map<String, dynamic> _$AddNewPostRequestBodyToJson(
  AddNewPostRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'visibility': instance.visibility,
};
