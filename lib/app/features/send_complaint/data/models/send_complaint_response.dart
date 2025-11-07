import 'package:json_annotation/json_annotation.dart';

part 'send_complaint_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SendComplaintResponse {
  final bool success;
  final int status;
  final String message;
  final SendComplaintData? data;

  SendComplaintResponse({
    required this.success,
    required this.status,
    required this.message,
    this.data,
  });

  factory SendComplaintResponse.fromJson(Map<String, dynamic> json) =>
      _$SendComplaintResponseFromJson(json);

  static List<SendComplaintResponse> fromJsonList(List<dynamic> list) {
    return list.map((e) => SendComplaintResponse.fromJson(e)).toList();
  }
}

@JsonSerializable(explicitToJson: true)
class SendComplaintData {
  final int id;
  final String title;
  final String description;
  final ComplaintType type;
  final List<ComplaintFile> files;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  SendComplaintData({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.files,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SendComplaintData.fromJson(Map<String, dynamic> json) =>
      _$SendComplaintDataFromJson(json);

  Map<String, dynamic> toJson() => _$SendComplaintDataToJson(this);
}

@JsonSerializable()
class ComplaintType {
  final int id;
  @JsonKey(name: 'type')
  final String typeName;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  ComplaintType({
    required this.id,
    required this.typeName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplaintType.fromJson(Map<String, dynamic> json) =>
      _$ComplaintTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintTypeToJson(this);
}

@JsonSerializable()
class ComplaintFile {
  final int id;
  final String image;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  ComplaintFile({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplaintFile.fromJson(Map<String, dynamic> json) =>
      _$ComplaintFileFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintFileToJson(this);
}
