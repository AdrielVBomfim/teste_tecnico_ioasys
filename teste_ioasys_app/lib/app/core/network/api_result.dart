import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';

abstract class ApiResult {}

class Success implements ApiResult {
  const Success({
    @required this.statusCode,
    @required this.data,
  });

  final int statusCode;
  final dynamic data;
}

class Erro implements ApiResult {
  const Erro({
    @required this.statusCode,
    @required this.message,
    @required this.data,
  });

  final int statusCode;
  final String message;
  final dynamic data;
}

class ApiError extends Erro {
  const ApiError({
    @required statusCode,
    @required message,
    @required data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );
}

class InternalError extends Erro {
  const InternalError({
    statusCode,
    @required message,
    data,
  }) : super(
          statusCode: statusCode,
          message: message,
          data: data,
        );
}

class InternetOff extends Erro {
  const InternetOff() : super(
    statusCode: null,
    message: Strings.algoInesperadoAconteceu,
    data: null,
  );
}
