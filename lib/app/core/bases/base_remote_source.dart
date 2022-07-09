import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/data/remote/rest_client.dart';

import '../../network/error_handlers.dart';
import '../../network/exceptions/base_exception.dart';
import '../config/build_config.dart';

abstract class BaseRemoteSource {

  RestClient _restClient = RestClient.create();

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        // TODO
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
