import 'package:json_annotation/json_annotation.dart';

part 'delete_post_response.g.dart';

@JsonSerializable()
class DeletePostResponse {
  final bool success;
  final int status;
  final String message;

  DeletePostResponse({
    required this.success,
    required this.status,
    required this.message,
  });

  factory DeletePostResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePostResponseFromJson(json);

}