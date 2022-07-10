import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';

const pageTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.appBarTextColor);

const movieTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.15,
    overflow: TextOverflow.ellipsis,
    color: AppColors.textColorPrimary);

const movieRatingStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorGreyDark);

const descTextStyle = TextStyle(

    fontSize: 13,
    overflow: TextOverflow.ellipsis,
    height: 1.5,
    color: AppColors.textColorGreyLight);

const groupLabelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColorPrimary);

const dateLabelStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.blueAccent);
