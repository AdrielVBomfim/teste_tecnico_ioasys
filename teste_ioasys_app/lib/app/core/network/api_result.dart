import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';

abstract class ApiResult {}

class Success implements ApiResult {
  const Success({
    @required this.statusCode,
    @required this.data,
    @required this.headers,
  });

  final int statusCode;
  final dynamic data;
  final dynamic headers;
}

class Erro implements ApiResult {
  const Erro({
    @required this.statusCode,
    @required this.message,
    @required this.data,
    @required this.headers,
  });

  final int statusCode;
  final String message;
  final dynamic data;
  final dynamic headers;
}

class ApiError extends Erro {
  const ApiError({
    @required statusCode,
    @required message,
    @required data,
    @required headers,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
          headers: headers,
        );
}

class InternalError extends Erro {
  const InternalError({
    statusCode,
    @required message,
    data,
    headers,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
          headers: headers,
        );
}

class InternetOff extends Erro {
  const InternetOff()
      : super(
          statusCode: null,
          message: Strings.semInternet,
          data: null,
          headers: null,
        );
}
