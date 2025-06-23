import 'package:json_annotation/json_annotation.dart';

import 'post_file.dart';

part 'posts_list_response.g.dart';

@JsonSerializable()
class PostsListResponse {
  final bool success;
  final int status;
  final String message;
  final List<Post> data;

  PostsListResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostsListResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsListResponseFromJson(json);
}

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String description;
  final String visibility;
  @JsonKey(name: 'student_name')
  final String studentName;
  final List<PostFile> files;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    required this.studentName,
    required this.files,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

enum AttachmentType {
  none,
  image,
  video,
  file,
}

