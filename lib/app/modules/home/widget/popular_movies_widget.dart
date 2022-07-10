import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widget/popular_movie_tile_widget.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_strings.dart';
import '../../../core/values/text_styles.dart';
import '../../../data/model/movie_model.dart';

class PopularMoviesWidget extends StatelessWidget {
  List<MovieModel> movies;
  Function(int) onClickFavorite;

  PopularMoviesWidget({required this.movies, required this.onClickFavorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: AppValues.margin_20,
              left: AppValues.margin_20,
              bottom: AppValues.margin_12),
          child: Text(
            'Recommended',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: groupLabelStyle,
          ),
        ),
        Container(
          height: 260,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                MovieModel model = movies[index];
                return PopularMovieTileWidget(
                  model: model,
                  rightMargin:
                      index == movies.length - 1 ? AppValues.margin_20 : 0,
                  leftMargin: index == 0 ? AppValues.margin_20 : 0,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: AppValues.margin_10,
                  ),
              itemCount: movies.length),
        )
      ],
    );
  }
}
