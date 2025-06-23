import 'package:json_annotation/json_annotation.dart';

part 'add_new_post_response.g.dart';

@JsonSerializable()
class AddNewPostResponse {
  final bool? success;
  final int? status;
  final String? message;
  final AddPostData? data;

  AddNewPostResponse({this.success, this.status, this.message, this.data});

  factory AddNewPostResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewPostResponseFromJson(json);

  static List<AddNewPostResponse> fromJsonList(List<dynamic> list) {
    return list.map((e) => AddNewPostResponse.fromJson(e)).toList();
  }
}

@JsonSerializable()
class AddPostData {
  final String title;
  final String description;
  final String visibility;

  @JsonKey(name: 'student_id')
  final int studentId;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final int id;
  final List<CreatedFile> files;

  AddPostData({
    required this.title,
    required this.description,
    required this.visibility,
    required this.studentId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.files,
  });

  factory AddPostData.fromJson(Map<String, dynamic> json) =>
      _$AddPostDataFromJson(json);
}

@JsonSerializable()
class CreatedFile {
  final int id;
  final String file;

  @JsonKey(name: 'post_id')
  final int postId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CreatedFile({
    required this.id,
    required this.file,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatedFile.fromJson(Map<String, dynamic> json) =>
      _$CreatedFileFromJson(json);
}
