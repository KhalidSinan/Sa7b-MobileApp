import 'package:json_annotation/json_annotation.dart';

part 'course_guidance_model.g.dart';

@JsonSerializable()
class CourseModel {
  final int id;
  final String name;

  @JsonKey(name: 'college_id')
  final int collegeId;

  @JsonKey(name: 'semester_id')
  final int semesterId;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  CourseModel({
    required this.id,
    required this.name,
    required this.collegeId,
    required this.semesterId,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
