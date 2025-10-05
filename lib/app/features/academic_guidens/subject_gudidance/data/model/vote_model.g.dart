// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) => VoteModel(
      id: (json['id'] as num).toInt(),
      studentId: (json['student_id'] as num).toInt(),
      academicGuidanceId: (json['academic_guidance_id'] as num).toInt(),
      type: json['type'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$VoteModelToJson(VoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'academic_guidance_id': instance.academicGuidanceId,
      'type': instance.type,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
