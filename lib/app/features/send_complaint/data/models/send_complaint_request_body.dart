import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'send_complaint_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SendComplaintRequestBody {
  final String title;
  final String description;
  @JsonKey(name: 'type_id')
  final int typeId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<File>? images;

  SendComplaintRequestBody({
    required this.title,
    required this.description,
    required this.typeId,
    this.images,
  });

  factory SendComplaintRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SendComplaintRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendComplaintRequestBodyToJson(this);
}
