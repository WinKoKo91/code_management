import 'package:flutter_getx_template/app/data/model/api_response.dart';
import 'package:flutter_getx_template/app/data/repository/repository.dart';
import 'package:get/get.dart';

import '../../../core/bases/base_controller.dart';

class HomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<RandomImageResponse> _response = RandomImageResponse().obs;

  RandomImageResponse get randomImageResponse => _response.value;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    getRandomDogImage();
    super.onReady();
  }

  getRandomDogImage() async {
    callDataService(
      _repository.fetchRandomDogImage(),
      onSuccess: _handleResponseSuccess,
    );
  }

  @override
  void onClose() {
    _response.close();
  }

  _handleResponseSuccess(RandomImageResponse response) {
    _response(response);
  }
}
