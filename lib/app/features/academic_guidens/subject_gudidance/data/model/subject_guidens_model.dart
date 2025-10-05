import 'package:json_annotation/json_annotation.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/course_guidance_model.dart';
import 'vote_model.dart';
import 'post_student_model.dart';

part 'subject_guidens_model.g.dart';

@JsonSerializable()
class SubjectGuidensModel {
  final int id;

  @JsonKey(name: 'student_id')
  final int studentId;

  @JsonKey(name: 'course_id')
  final int courseId;

  final String content;
  final String title;
  final String type;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  final List<String>? links;
  final CourseModel? course;
  final List<VoteModel> votes;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final PostStudentModel? student;

  SubjectGuidensModel({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.content,
    required this.title,
    required this.type,
    required this.voteCount,
    this.links,
    this.course,
    this.votes = const [],
    required this.createdAt,
    required this.updatedAt,
    this.student,
  });

  factory SubjectGuidensModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectGuidensModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectGuidensModelToJson(this);
}
