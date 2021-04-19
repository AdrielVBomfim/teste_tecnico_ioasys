import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/injection_container.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/repositories/iheaders_repository.dart';

class GravarHeadersUsecase {
  GravarHeadersUsecase({
    IHeadersRepository repository,
  }) : _repository = repository ?? dependencia<IHeadersRepository>();

  final IHeadersRepository _repository;


  Future<void> call({
    @required String uid,
    @required String client,
    @required String accessToken,
  }) async {
    return _repository.gravarHeaders(
        uid: uid, client: client, accessToken: accessToken);
  }
}
