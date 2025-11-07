import 'package:json_annotation/json_annotation.dart';

part 'certificate_response.g.dart';

@JsonSerializable()
class CertificateResponse {
  final bool success;
  final int status;
  final String message;
  final List<CertificateData> data;

  CertificateResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$CertificateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateResponseToJson(this);
}

@JsonSerializable()
class CertificateData {
  final int id;
  final String file;
  @JsonKey(name: 'student_id')
  final int studentId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CertificateData({
    required this.id,
    required this.file,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CertificateData.fromJson(Map<String, dynamic> json) =>
      _$CertificateDataFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateDataToJson(this);
}
