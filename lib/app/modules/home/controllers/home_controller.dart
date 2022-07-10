import 'package:flutter_getx_template/app/data/model/api_response.dart';
import 'package:flutter_getx_template/app/data/model/movie_model.dart';
import 'package:flutter_getx_template/app/data/repository/repository.dart';
import 'package:flutter_getx_template/flavors.dart';
import 'package:get/get.dart';

import '../../../core/bases/base_controller.dart';

class HomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  var _popularMovie = <MovieModel>[].obs;

  List<MovieModel> get popularMovie => _popularMovie.value;

  var _upcomingMovie = <MovieModel>[].obs;

  List<MovieModel> get upcomingMovie => _upcomingMovie.value;

  @override
  void onInit() {
    getPopularMovie();
    getUpcomingMovie();
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  getPopularMovie() async {
    callDataService(
      _repository.getPopularMovie(),
      onSuccess: (PopularMovieResponse response) {
        _popularMovie.value = response.results.map((e) {
          e.posterPath = F.imageBaseUrl + e.posterPath;
          return e;
        }).toList();
      },
    );
  }

  getUpcomingMovie() async {
    callDataService(
      _repository.getUpcomingMovie(),
      onSuccess: (UpcomingMovieResponse response) {
        _upcomingMovie.value = response.results.map((e) {
          e.posterPath = F.imageBaseUrl + e.posterPath;
          return e;
        }).toList();
      },
    );
  }

  @override
  void onClose() {
    _popularMovie.close();
    _upcomingMovie.close();
  }

  onClickPopularMovieFavorite(int id) {
    MovieModel model = popularMovie.firstWhere((element) => element.id == id);
    model.isFavorite = !model.isFavorite;
    _popularMovie.refresh();
  }

  onClickUpcomingMovieFavorite(int id) {
    MovieModel model = upcomingMovie.firstWhere((element) => element.id == id);
    model.isFavorite = !model.isFavorite;
    _upcomingMovie.refresh();
  }
}
