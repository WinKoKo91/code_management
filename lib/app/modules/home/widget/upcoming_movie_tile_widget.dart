import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app.dart';
import 'package:flutter_getx_template/app/data/model/movie_model.dart';
import 'package:flutter_getx_template/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/values/app_strings.dart';
import '../../../core/values/text_styles.dart';
import 'icon_text_widget.dart';
import 'movie_poster_widget.dart';

class UpcomingMovieTileWidget extends GetView<HomeController> {
  const UpcomingMovieTileWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MOVIE_DETAIL, arguments: model);
      },
      child: Container(
        height: 140,
        margin: EdgeInsets.symmetric(horizontal: AppValues.margin_20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePosterWidget(
              imageURL: model.posterPath,
              isFavorite: model.isFavorite,
              onClickFavorite: () {
                controller.onClickMovieFavorite(model.id);
              },
            ),
            SizedBox(
              width: AppValues.margin_20,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: movieTitleStyle,
                    maxLines: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppValues.margin_6),
                      child: Text(
                        model.overview,
                        style: descTextStyle,
                        maxLines: 4,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconTextWidget(
                          label: model.voteAverage.toString(),
                          icon: Icons.star,
                          iconColor: Colors.amberAccent),
                      SizedBox(
                        width: AppValues.margin_10,
                      ),
                      IconTextWidget(
                          label: model.voteCount.toString(),
                          icon: Icons.messenger_outline,
                          iconColor: Colors.blueAccent),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
