// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePostResponse _$DeletePostResponseFromJson(Map<String, dynamic> json) =>
    DeletePostResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeletePostResponseToJson(DeletePostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
    };
