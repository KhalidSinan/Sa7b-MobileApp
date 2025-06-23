import 'package:json_annotation/json_annotation.dart';

part 'post_file.g.dart';

@JsonSerializable()
class PostFile {
  final int id;
  final String file;
  @JsonKey(name: 'post_id')
  final int postId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  PostFile({
    required this.id,
    required this.file,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostFile.fromJson(Map<String, dynamic> json) =>
      _$PostFileFromJson(json);
}