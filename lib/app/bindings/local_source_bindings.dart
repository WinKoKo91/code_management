import 'package:flutter_getx_template/app/data/local/get_storage/get_storage_manager.dart';
import 'package:flutter_getx_template/app/data/local/get_storage/get_storage_manager_impl.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorageManager>(
      () => GetStorageManagerImpl(),
      tag: (GetStorageManager).toString(),
      fenix: true,
    );
  }
}
