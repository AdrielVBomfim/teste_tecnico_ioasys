import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/core/network/http_methods.dart';
import 'custom_dio/custom_dio_creator.dart';

abstract class RequestHandler {
  static final Connectivity _connectivity = Connectivity();
  static final CustomDioCreator _dio = CustomDioCreator();

  static Future<ApiResult> request({@required HttpMethod httpMethod}) async {
    try {
      final isConnected =
          await _isInternetAvailable(await _connectivity.checkConnectivity());

      if (!isConnected) {
        return InternetOff();
      }

      return await _executeHttpRequest(httpMethod);
    } on PlatformException catch (e) {
      return InternalError(message: e.message);
    }
  }

  static Future<ApiResult> _executeHttpRequest(HttpMethod httpMethod) async {
    Response response;

    try {
      switch (httpMethod.methodName) {
        case HttpMethodName.GET:
          response = await _dio.get((httpMethod as Get).url);
          break;
        case HttpMethodName.POST:
          response = await _dio.post((httpMethod as Post).url,
              data: (httpMethod as Post).body);
          break;
        case HttpMethodName.DELETE:
          response = await _dio.delete((httpMethod as Delete).url,
              data: (httpMethod as Delete).body);
          break;
        case HttpMethodName.PUT:
          response = await _dio.put((httpMethod as Put).url,
              data: (httpMethod as Put).body);
          break;
        case HttpMethodName.PATCH:
          response = await _dio.patch((httpMethod as Patch).url,
              data: (httpMethod as Patch).body);
          break;
        default:
          return InternalError(message: 'Deu Ruim :(');
      }
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 401) {
        return ApiError(
            statusCode: dioError.response.statusCode,
            message: Strings.credenciaisIncorretas,
            data: dioError.response.data,
            headers: dioError.response.headers);
      }

      return ApiError(
        statusCode: dioError.response.statusCode,
        message: dioError.response.statusMessage,
        data: dioError.response.data,
        headers: dioError.response.headers,
      );
    }

    return Success(
      statusCode: response.statusCode,
      data: response.data,
      headers: response.headers,
    );
  }

  static Future<bool> _isInternetAvailable(
      ConnectivityResult connectivityResult) async {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        return true;
        break;
      case ConnectivityResult.mobile:
        return true;
        break;
      default:
        return false;
    }
  }
}
