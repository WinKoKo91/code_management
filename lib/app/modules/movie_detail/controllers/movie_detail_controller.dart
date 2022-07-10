import 'package:flutter_getx_template/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/bases/base_controller.dart';
import '../../../data/model/movie_model.dart';

class MovieDetailController extends BaseController {
  HomeController homeController = Get.find<HomeController>();

  var _movie = Rxn<MovieModel>();

  MovieModel get movie => _movie.value!;

  var _isFavorite = false.obs;

  get isFavorite => _isFavorite.value;



  @override
  void onInit() {
    _movie(Get.arguments);
    _isFavorite(movie.isFavorite);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _movie.close();
    _isFavorite.close();
  }

  void onClickFavorite() {
    _isFavorite.toggle();
    homeController.onClickMovieFavorite(movie.id);
  }
}
