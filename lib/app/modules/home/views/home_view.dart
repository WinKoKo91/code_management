import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/bases/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../global_widgets/asset_image_view.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Home',
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
    return controller.randomImageResponse.status != 'success'
        ? Container()
        : Container(
            margin: EdgeInsets.all(AppValues.margin_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Random Image',
                  style: cardTitleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Image.network(
                  controller.randomImageResponse.message,
                ),
              ],
            ),
          );
  }
}
