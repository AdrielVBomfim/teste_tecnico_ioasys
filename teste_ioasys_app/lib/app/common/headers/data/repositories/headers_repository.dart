import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/injection_container.dart';
import 'package:teste_ioasys_app/app/common/headers/data/datasources/headers_datasource.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/repositories/iheaders_repository.dart';

class HeadersRepository implements IHeadersRepository {
  HeadersRepository({
    @required HeadersDatasource headersDatasource,
  }) : _headersDatasource =
            headersDatasource ?? dependencia<HeadersDatasource>();

  HeadersDatasource _headersDatasource;

  @override
  Future<void> gravarHeaders({
    String uid,
    String client,
    String accessToken,
  }) {
    return _headersDatasource.gravarHeaders(
      uid: uid,
      client: client,
      accessToken: accessToken,
    );
  }

  @override
  Future<Map<String, String>> lerHeaders() {
    return _headersDatasource.lerHeaders();
  }
}
