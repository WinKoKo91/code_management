import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_strings.dart';

import '../../../core/values/text_styles.dart';

class IconTextWidget extends StatelessWidget {
  IconTextWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  String label;
  IconData icon;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        SizedBox(
          width: AppValues.margin_4,
        ),
        Text(
          label,
          style: movieRatingStyle,
        ),
      ],
    );
  }
}
