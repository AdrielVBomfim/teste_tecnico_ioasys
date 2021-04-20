import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/empresa_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/features/home/domain/repositories/i_empresas_repository.dart';
import 'package:teste_ioasys_app/app/features/home/domain/usecases/consultar_empresas_usecase.dart';

class MockEmpresasRepository extends Mock
    implements IEmpresasRepository {}

void main() {
  MockEmpresasRepository repositoryMock;
  ConsultarEmpresasUsecase usecase;
  EnterpriseTypeModel tEnterpriseType;
  EmpresaModel tEmpresa;

  setUp(() {
    repositoryMock = MockEmpresasRepository();
    usecase = ConsultarEmpresasUsecase(repository: repositoryMock);
  });

  group('Testes do usecase de login', () {
    tEnterpriseType = EnterpriseTypeModel(
      enterpriseTypeName: 'textile',
      id: 6,
    );

    tEmpresa = EmpresaModel(
        id: 423,
        city: 'aracaju',
        country: 'BR',
        description: 'uma empresa',
        emailEnterprise: '',
        enterpriseName: 'Pizza do bairro',
        enterpriseType: tEnterpriseType,
        facebook: '',
        twitter: '',
        linkedin: '',
        phone: '',
        value: 0,
        sharePrice: 0.0,
        ownEnterprise: false,
        photo: '');


    test('Caso de sucesso ao consultar empresas', () async {
      when(repositoryMock.getEmpresas()).thenAnswer(
            (_) async => Right([tEmpresa]),
      );

      final result = await usecase();

      expect(
        result,
        isA<Right<Erro, List<Empresa>>>(),
      );
    });

    test('Caso de erro ao logar', () async {
      when(repositoryMock.getEmpresas()).thenAnswer(
            (_) async => Left(Erro(
              data: {},
              statusCode: 403,
              headers: {},
              message: '',
            )),
      );

      final result = await usecase();

      expect(
        result,
        isA<Left<Erro, List<Empresa>>>(),
      );
    });
  });
}
