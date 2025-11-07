import 'package:json_annotation/json_annotation.dart';

part 'follow_and_unfollow_response.g.dart';


@JsonSerializable()
class FollowAndUnfollowResponse {
  final bool success;
  final int status;
  final String message;

  FollowAndUnfollowResponse({
    required this.success,
    required this.status,
    required this.message,
  });

  factory FollowAndUnfollowResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowAndUnfollowResponseFromJson(json);
}
