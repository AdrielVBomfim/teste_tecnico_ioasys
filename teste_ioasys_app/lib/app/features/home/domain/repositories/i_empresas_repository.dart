import 'package:dartz/dartz.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

abstract class IEmpresasRepository {
  Future<Either<Erro, List<Empresa>>> getEmpresas({String consultaNome});
}