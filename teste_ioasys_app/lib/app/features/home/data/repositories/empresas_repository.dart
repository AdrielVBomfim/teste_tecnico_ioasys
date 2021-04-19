import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/data/datasources/empresas_datasource.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/empresa_model.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/features/home/domain/repositories/i_empresas_repository.dart';
import 'package:teste_ioasys_app/injection_container.dart';

class EmpresasRepository implements IEmpresasRepository {
  EmpresasRepository({
    @required EmpresasDatasource empresasDatasource,
  }) : _empresasDatasource =
            empresasDatasource ?? dependencia<EmpresasDatasource>();

  EmpresasDatasource _empresasDatasource;

  @override
  Future<Either<Erro, List<Empresa>>> getEmpresas({String consultaNome}) async {
    final result =
        await _empresasDatasource.getEmpresas(consultaNome: consultaNome);

    if (result is Success) {
      final empresas = (result.data['enterprises'] as List)
          .map((dynamic json) => EmpresaModel.fromJson(json))
          .toList();

      return Right(empresas);
    } else {
      return Left(result);
    }
  }
}
