import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/model/movie_model.dart';
import 'package:flutter_getx_template/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../core/values/app_strings.dart';
import '../../../core/values/text_styles.dart';
import '../../../routes/app_pages.dart';
import 'movie_poster_widget.dart';

class PopularMovieTileWidget extends GetView<HomeController> {
  const PopularMovieTileWidget({
    Key? key,
    required this.model,
    this.leftMargin = 0,
    this.rightMargin = 0,
  }) : super(key: key);

  final MovieModel model;
  final double leftMargin;
  final double rightMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MOVIE_DETAIL, arguments: model);
      },
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePosterWidget(
              imageURL: model.posterPath,
              isFavorite: model.isFavorite,
              onClickFavorite: () {
                controller.onClickMovieFavorite(model.id);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppValues.margin_6),
              child: Text(
                model.title,
                style: movieTitleStyle,
                maxLines: 2,
              ),
            ),
            Row(
              children: [
                Text(
                  model.voteAverage.toString(),
                  style: movieRatingStyle,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
