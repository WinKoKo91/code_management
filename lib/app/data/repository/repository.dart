
import '../model/api_response.dart';

abstract class Repository {
  Future<PopularMovieResponse> getPopularMovie();
  Future<UpcomingMovieResponse> getUpcomingMovie();
}
