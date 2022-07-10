import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widget/popular_movies_widget.dart';

import 'package:get/get.dart';

import '../../../../flavors.dart';
import '../../../core/bases/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../global_widgets/asset_image_view.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/home_controller.dart';
import '../widget/upcoming_movies_widget.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: F.title,
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => _getView()),
      ),
    );
  }

  Widget _getView() {
    return controller.popularMovie.isEmpty
        ? Container()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PopularMoviesWidget(
                  movies: controller.popularMovie,
                  onClickFavorite: (id) {
                    controller.onClickPopularMovieFavorite(id);
                  },
                ),
                UpcomingMoviesWidget(
                  movies: controller.upcomingMovie,
                  onClickFavorite: (id) {
                    controller.onClickPopularMovieFavorite(id);
                  },
                )
              ],
            ),
          );
  }
}
