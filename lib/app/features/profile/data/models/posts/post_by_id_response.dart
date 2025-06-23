import 'package:json_annotation/json_annotation.dart';

import 'post_file.dart';

part 'post_by_id_response.g.dart';

@JsonSerializable()
class PostByIdResponse {
  final bool? success;
  final int? status;
  final String? message;

  @JsonKey(name: 'data')
  final PostData? data;

  PostByIdResponse(this.success, this.status, this.message, this.data);

  factory PostByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$PostByIdResponseFromJson(json);
}

@JsonSerializable()
class PostData {
  final int id;
  final String title;
  final String description;
  final String visibility;

  @JsonKey(name: 'student_name')
  final String studentName;

  final List<PostFile> files;

  PostData({
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    required this.studentName,
    required this.files,
  });

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}


