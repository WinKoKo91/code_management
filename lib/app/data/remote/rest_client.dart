import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

import '../../network/dio_provider.dart';
import '../model/api_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  static RestClient get to => Get.find();

  factory RestClient(
    Dio dio,
  ) = _RestClient;


  static RestClient create({String? token}) {
    final dio = DioProvider.dioWithHeaderToken;
    return RestClient(dio);
  }
  @POST('popular')
  Future<PopularMovieResponse> getPopularMovie(
      {@Query('api_key') required String apiKey});

  @POST('upcoming')
  Future<UpcomingMovieResponse> getUpcomingMovie(
      {@Query('api_key') required String apiKey});

}
