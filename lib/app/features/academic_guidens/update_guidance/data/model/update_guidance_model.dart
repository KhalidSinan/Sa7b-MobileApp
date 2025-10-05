import 'package:json_annotation/json_annotation.dart';

part 'update_guidance_model.g.dart';

@JsonSerializable()
class UpdateGuidanceModel {
  final int id;
  final String title;
  final String content;
  final String type;

  UpdateGuidanceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
  });

  factory UpdateGuidanceModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuidanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGuidanceModelToJson(this);
}
