// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_complaint_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendComplaintRequestBody _$SendComplaintRequestBodyFromJson(
  Map<String, dynamic> json,
) => SendComplaintRequestBody(
  title: json['title'] as String,
  description: json['description'] as String,
  typeId: (json['type_id'] as num).toInt(),
);

Map<String, dynamic> _$SendComplaintRequestBodyToJson(
  SendComplaintRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'type_id': instance.typeId,
};
