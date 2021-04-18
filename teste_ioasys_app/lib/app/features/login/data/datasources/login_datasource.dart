import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/core/network/http_methods.dart';
import 'package:teste_ioasys_app/app/core/network/request_handler.dart';

class LoginDatasource {
  Future<ApiResult> postLogin({
    @required String email,
    @required String senha,
  }) async {
    return await RequestHandler.request(
      httpMethod: Post(
        body: {
          'email': email,
          'password': senha,
        },
        url: 'users/auth/sign_in',
      ),
    );
  }
}
