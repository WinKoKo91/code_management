
import '../model/api_response.dart';

abstract class Repository {
  Future<RandomImageResponse> fetchRandomDogImage();
}
