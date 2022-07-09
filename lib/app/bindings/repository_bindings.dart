import 'package:flutter_getx_template/app/data/repository/repository.dart';
import 'package:flutter_getx_template/app/data/repository/repository_impl.dart';
import 'package:get/get.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Repository>(
      () => RepositoryImpl(),
      tag: (Repository).toString(),
    );
  }
}
