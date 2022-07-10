import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/bases/base_view.dart';
import 'package:flutter_getx_template/app/core/values/app_strings.dart';
import 'package:flutter_getx_template/app/modules/home/widget/movie_poster_widget.dart';

import 'package:get/get.dart';

import '../../../core/values/text_styles.dart';
import '../../home/widget/icon_text_widget.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends BaseView<MovieDetailController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget? floatingActionButton() {
    return Obx(
      () => FloatingActionButton(
        onPressed: controller.onClickFavorite,
        child: Icon(
            controller.isFavorite ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: Get.height * 0.4,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: controller.movie.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.movie.title,
                          style: movieTitleStyle,
                        ),
                        IconTextWidget(
                            label: controller.movie.voteAverage.toString(),
                            icon: Icons.star,
                            iconColor: Colors.amberAccent),
                      ],
                    ),
                    SizedBox(
                      height: AppValues.margin_6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.movie.releaseDate,
                          style: dateLabelStyle,
                        ),
                        Text('${controller.movie.voteCount} votes',
                            style: movieRatingStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(controller.movie.overview),
              ),
            ],
          ),
        )
      ],
    );
  }
}
