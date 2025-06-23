import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_post_request_body.g.dart';

@JsonSerializable()
class AddNewPostRequestBody {
  final String title;
  final String description;
  final String visibility;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<File>? files;

  AddNewPostRequestBody({
    required this.title,
    required this.description,
    required this.visibility,
    this.files,
  });

  factory AddNewPostRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddNewPostRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewPostRequestBodyToJson(this);
}
