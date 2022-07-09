import 'package:flutter_getx_template/app/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/api_response.dart';
import '../remote/rest_client.dart';

class RepositoryImpl extends Repository {
  final RestClient _restClient = Get.find(tag: (RestClient).toString());
  late var _storage;

  @override
  Future<RandomImageResponse> fetchRandomDogImage() {
    return _restClient.getRandomDogImage();
  }
}
