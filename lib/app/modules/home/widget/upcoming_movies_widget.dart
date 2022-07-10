import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widget/popular_movie_tile_widget.dart';
import 'package:flutter_getx_template/app/modules/home/widget/upcoming_movie_tile_widget.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_strings.dart';
import '../../../core/values/text_styles.dart';
import '../../../data/model/movie_model.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  List<MovieModel> movies;
  Function(int) onClickFavorite;

  UpcomingMoviesWidget({required this.movies, required this.onClickFavorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppValues.margin_20,
              left: AppValues.margin_20, bottom: AppValues.margin_12),
          child: Text(
            'Upcoming Movies',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: groupLabelStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: AppValues.margin_10),
          child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                MovieModel model = movies[index];
                return UpcomingMovieTileWidget(
                  model: model,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: AppValues.margin_20,
                  ),
              itemCount: movies.length),
        )
      ],
    );
  }
}
