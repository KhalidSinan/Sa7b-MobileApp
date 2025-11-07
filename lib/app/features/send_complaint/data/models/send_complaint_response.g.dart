// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_complaint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendComplaintResponse _$SendComplaintResponseFromJson(
  Map<String, dynamic> json,
) => SendComplaintResponse(
  success: json['success'] as bool,
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  data:
      json['data'] == null
          ? null
          : SendComplaintData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SendComplaintResponseToJson(
  SendComplaintResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.toJson(),
};

SendComplaintData _$SendComplaintDataFromJson(Map<String, dynamic> json) =>
    SendComplaintData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      type: ComplaintType.fromJson(json['type'] as Map<String, dynamic>),
      files:
          (json['files'] as List<dynamic>)
              .map((e) => ComplaintFile.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SendComplaintDataToJson(SendComplaintData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type.toJson(),
      'files': instance.files.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ComplaintType _$ComplaintTypeFromJson(Map<String, dynamic> json) =>
    ComplaintType(
      id: (json['id'] as num).toInt(),
      typeName: json['type'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ComplaintTypeToJson(ComplaintType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.typeName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ComplaintFile _$ComplaintFileFromJson(Map<String, dynamic> json) =>
    ComplaintFile(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ComplaintFileToJson(ComplaintFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
