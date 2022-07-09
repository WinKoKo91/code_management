import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class RandomImageResponse {
  final String message;
  final String status;

  RandomImageResponse({this.message = "", this.status = ""});

  factory RandomImageResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomImageResponseFromJson(json);
}
