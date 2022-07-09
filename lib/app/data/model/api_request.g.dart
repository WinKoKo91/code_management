// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequest _$ApiRequestFromJson(Map<String, dynamic> json) => ApiRequest(
      apiUser: json['api_user'] as String,
      apiPassword: json['api_password'] as String,
    );

Map<String, dynamic> _$ApiRequestToJson(ApiRequest instance) =>
    <String, dynamic>{
      'api_user': instance.apiUser,
      'api_password': instance.apiPassword,
    };
