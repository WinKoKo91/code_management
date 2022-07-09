// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomImageResponse _$RandomImageResponseFromJson(Map<String, dynamic> json) =>
    RandomImageResponse(
      message: json['message'] as String? ?? "",
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$RandomImageResponseToJson(
        RandomImageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
