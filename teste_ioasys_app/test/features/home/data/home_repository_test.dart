import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/data/datasources/empresas_datasource.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/empresa_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/repositories/empresas_repository.dart';

class MockEmpresasDataSource extends Mock implements EmpresasDatasource {}

void main() {
  MockEmpresasDataSource dataSource;
  EmpresasRepository repository;
  EnterpriseTypeModel tEnterpriseType;
  EmpresaModel tEmpresa;
  Map<String, dynamic> tDados;

  setUp(() {
    dataSource = MockEmpresasDataSource();
    repository = EmpresasRepository(empresasDatasource: dataSource);
  });

  group('Testes repositório Empresas ', () {
    tDados = {
      'enterprises': [
        {
          'id': 1,
          'email_enterprise': null,
          'facebook': null,
          'twitter': null,
          'linkedin': null,
          'phone': null,
          'own_enterprise': false,
          'enterprise_name': 'Fluoretiq Limited',
          'photo': '/uploads/enterprise/photo/1/240.jpeg',
          'description': 'FluoretiQ is a Bristol based medtech start-up developing diagnostic technology to enable bacteria identification within the average consultation window, so that patients can get the right anti-biotics from the start.  ',
          'city': 'Bristol',
          'country': 'UK',
          'value': 0,
          'share_price': 5000.0,
          'enterprise_type': {
            'id': 3,
            'enterprise_type_name': 'Health'
          }
        }
      ]
    };

    tEnterpriseType = EnterpriseTypeModel(
      enterpriseTypeName: 'Health',
      id: 3,
    );

    tEmpresa = EmpresaModel(
        id: 1,
        city: 'Bristol',
        country: 'UK',
        description: 'FluoretiQ is a Bristol based medtech start-up developing diagnostic technology to enable bacteria identification within the average consultation window, so that patients can get the right anti-biotics from the start.  ',
        emailEnterprise: null,
        enterpriseName: 'Fluoretiq Limited',
        enterpriseType: tEnterpriseType,
        facebook: null,
        twitter: null,
        linkedin: null,
        phone: null,
        value: 0,
        sharePrice: 5000.0,
        ownEnterprise: false,
        photo: '/uploads/enterprise/photo/1/240.jpeg');


    Future<void> setUpSuccess() async {
      when(
        dataSource.getEmpresas(consultaNome: anyNamed('consultaNome')),
      ).thenAnswer(
        (_) async => Success(
          data: tDados,
          statusCode: 200,
          headers: {},
        ),
      );
    }

    Future<void> setUpApiError() async {
      when(
        dataSource.getEmpresas(consultaNome: anyNamed('consultaNome')),
      ).thenAnswer(
        (_) async => ApiError(
          data: {},
          statusCode: 403,
          headers: {},
          message: '',
        ),
      );
    }

    Future<void> setUpInternetOff() async {
      when(
        dataSource.getEmpresas(
          consultaNome: anyNamed('consultaNome'),
        ),
      ).thenAnswer(
        (_) async => InternetOff(),
      );
    }

    test('deve obter os dados das empresas', () async {
      await setUpSuccess();

      final result = await repository.getEmpresas();

      List<EmpresaModel> dadosRetorno;

      result.fold(
        (l) => null,
        (dados) => {dadosRetorno = dados},
      );
      expect(dadosRetorno, [tEmpresa]);
    });

    test(
      'deve dar erro de api ao tentar obter empresas',
      () async {
        setUpApiError();

        final result = await repository.getEmpresas();
        Erro resultFold;

        result.fold(
              (erro) => {resultFold = erro},
              (r) => null,
        );

        expect(resultFold is ApiError, true);
      },
    );

    test(
      'deve dar erro de sem conexão à internet ao tentar obter empresas',
      () async {
        setUpInternetOff();

        final result = await repository.getEmpresas();
        Erro resultFold;

        result.fold(
              (erro) => {resultFold = erro},
              (r) => null,
        );

        expect(resultFold is InternetOff, true);
      },
    );
  });
}
