// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateResponse _$CertificateResponseFromJson(Map<String, dynamic> json) =>
    CertificateResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => CertificateData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CertificateResponseToJson(
  CertificateResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

CertificateData _$CertificateDataFromJson(Map<String, dynamic> json) =>
    CertificateData(
      id: (json['id'] as num).toInt(),
      file: json['file'] as String,
      studentId: (json['student_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CertificateDataToJson(CertificateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'student_id': instance.studentId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
