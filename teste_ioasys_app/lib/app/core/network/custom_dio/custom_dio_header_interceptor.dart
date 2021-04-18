import 'dart:io';
import 'package:dio/dio.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/usecases/ler_headers_usecase.dart';

class CustomDioHeaderInterceptor extends InterceptorsWrapper {
  CustomDioHeaderInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = await LerHeadersUsecase()();

    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    options.headers['uid'] = headers['uid'];
    options.headers['access-token'] = headers['access-token'];
    options.headers['client'] = headers['client'];
    handler.next(options);
  }
}