import 'package:json_annotation/json_annotation.dart';

part 'vote_model.g.dart';

@JsonSerializable()
class VoteModel {
  final int id;

  @JsonKey(name: 'student_id')
  final int studentId;

  @JsonKey(name: 'academic_guidance_id')
  final int academicGuidanceId;

  final String type;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  VoteModel({
    required this.id,
    required this.studentId,
    required this.academicGuidanceId,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) =>
      _$VoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoteModelToJson(this);
}
