// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_guidens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectGuidensModel _$SubjectGuidensModelFromJson(Map<String, dynamic> json) =>
    SubjectGuidensModel(
      id: (json['id'] as num).toInt(),
      studentId: (json['student_id'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
      content: json['content'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      voteCount: (json['vote_count'] as num).toInt(),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      votes: (json['votes'] as List<dynamic>?)
              ?.map((e) => VoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      student: json['student'] == null
          ? null
          : PostStudentModel.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectGuidensModelToJson(
        SubjectGuidensModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'course_id': instance.courseId,
      'content': instance.content,
      'title': instance.title,
      'type': instance.type,
      'vote_count': instance.voteCount,
      'links': instance.links,
      'course': instance.course,
      'votes': instance.votes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'student': instance.student,
    };
