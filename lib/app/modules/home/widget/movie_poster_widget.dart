import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_strings.dart';
import '../controllers/home_controller.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget(
      {Key? key,
      required this.imageURL,
      this.isFavorite = false,
      this.showFavorite = true,
      this.onClickFavorite})
      : super(key: key);

  final String imageURL;
  final bool isFavorite;
  final bool showFavorite;
  final VoidCallback? onClickFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageURL,
              fit: BoxFit.cover,
            ),

            Visibility(
              visible: showFavorite,
              child: Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: onClickFavorite,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(8)),
                          color: Colors.white70 //AppColors.favoriteBGColor,
                          ),
                      padding: EdgeInsets.all(AppValues.padding_4),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.pinkAccent : Colors.blueGrey,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
