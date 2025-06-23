import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  final bool success;
  final int status;
  final String message;

  EditProfileResponse({
    required this.success,
    required this.status,
    required this.message,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
}
