import 'package:dartz/dartz.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/features/home/domain/repositories/i_empresas_repository.dart';
import 'package:teste_ioasys_app/injection_container.dart';

class ConsultarEmpresasUsecase {
  ConsultarEmpresasUsecase({
    IEmpresasRepository repository,
  }) : _repository = repository ?? dependencia<IEmpresasRepository>();

  final IEmpresasRepository _repository;

  Future<Either<Erro, List<Empresa>>> call({String consultaNome}) async {
    return _repository.getEmpresas(consultaNome: consultaNome);
  }
}
