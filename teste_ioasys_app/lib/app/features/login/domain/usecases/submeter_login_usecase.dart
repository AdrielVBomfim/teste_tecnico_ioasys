import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/injection_container.dart';
import 'package:teste_ioasys_app/app/features/login/domain/repositories/i_login_repository.dart';

class SubmeterLoginUsecase {
  SubmeterLoginUsecase({
    ILoginRepository repository,
  }) : _repository = repository ?? dependencia<ILoginRepository>();

  final ILoginRepository _repository;

  Future<Either<Erro, bool>> call({
    @required String email,
    @required String senha,
  }) async {
    return _repository.submeterLogin(
      email: email,
      senha: senha,
    );
  }
}
