import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/injection_container.dart';
import 'package:teste_ioasys_app/app/features/login/data/datasources/login_datasource.dart';
import 'package:teste_ioasys_app/app/features/login/domain/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository({
    @required LoginDatasource loginDatasource,
  }) : _loginDatasource = loginDatasource ?? dependencia<LoginDatasource>();

  LoginDatasource _loginDatasource;

  @override
  Future<Either<Erro, bool>> submeterLogin({
    String email,
    String senha,
  }) async {
    final result = await _loginDatasource.postLogin(
      email: email,
      senha: senha,
    );

    if (result is Success) {
      return Right(true);
    } else {
      return Left(result);
    }
  }
}
