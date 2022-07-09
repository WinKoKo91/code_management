
import 'package:flutter_getx_template/app/network/exceptions/base_exception.dart';

abstract class BaseApiException extends BaseException {
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = 0, this.status = "", String message = ""})
      : super(message: message);
}
