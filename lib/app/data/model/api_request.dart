import 'package:json_annotation/json_annotation.dart';


part 'api_request.g.dart';

@JsonSerializable()
class ApiRequest {
  @JsonKey(name: 'api_user')
  final String apiUser;
  @JsonKey(name: 'api_password')
  final String apiPassword;

  ApiRequest({
    required this.apiUser,
    required this.apiPassword,
  });

  factory ApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRequestToJson(this);
}


