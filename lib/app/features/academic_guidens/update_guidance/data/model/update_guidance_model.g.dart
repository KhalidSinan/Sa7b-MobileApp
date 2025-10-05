// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guidance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGuidanceModel _$UpdateGuidanceModelFromJson(Map<String, dynamic> json) =>
    UpdateGuidanceModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UpdateGuidanceModelToJson(
        UpdateGuidanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
    };
