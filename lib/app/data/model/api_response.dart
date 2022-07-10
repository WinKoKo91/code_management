import 'package:json_annotation/json_annotation.dart';

import 'date_duration_model.dart';
import 'movie_model.dart';

part 'api_response.g.dart';

@JsonSerializable()
class PopularMovieResponse {
  int page;
  List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  PopularMovieResponse(
      this.page, this.results, this.totalPages, this.totalResults);

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
}

@JsonSerializable()
class UpcomingMovieResponse {
  DateDurationModel dates;
  int page;
  List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  UpcomingMovieResponse(
      this.dates, this.page, this.results, this.totalPages, this.totalResults);

  factory UpcomingMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMovieResponseFromJson(json);
}
