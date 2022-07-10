


import 'package:json_annotation/json_annotation.dart';

part 'date_duration_model.g.dart';

@JsonSerializable()
class DateDurationModel{
  String? maximum;
  String? minimum;

  DateDurationModel({this.maximum, this.minimum});

  factory DateDurationModel.fromJson(Map<String, dynamic> json) =>
      _$DateDurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DateDurationModelToJson(this);

}