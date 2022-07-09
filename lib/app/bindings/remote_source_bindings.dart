import 'package:flutter_getx_template/app/data/remote/rest_client.dart';
import 'package:get/get.dart';


class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(
      () => RestClient.create(),
      tag: (RestClient).toString(),
    );
  }
}
