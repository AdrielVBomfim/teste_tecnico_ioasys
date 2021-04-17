import 'dart:io';

import 'package:dio/dio.dart';

class CustomDioHeaderInterceptor extends InterceptorsWrapper {
  CustomDioHeaderInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    options.headers["uid"] = 'placeholder';
    options.headers["access-token"] = 'placeholder';
    options.headers["client"] = 'placeholder';
    handler.next(options);
  }
}