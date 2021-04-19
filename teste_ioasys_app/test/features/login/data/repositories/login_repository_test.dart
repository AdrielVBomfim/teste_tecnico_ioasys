import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/empresa_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/repositories/empresas_repository.dart';
import 'package:teste_ioasys_app/app/features/login/data/datasources/login_datasource.dart';
import 'package:teste_ioasys_app/app/features/login/data/repositories/login_repository.dart';

class MockLoginDataSource extends Mock implements LoginDatasource {}

void main() {
  MockLoginDataSource dataSource;
  LoginRepository repository;
  final Headers tHeaders = Headers();

  setUp(() {
    dataSource = MockLoginDataSource();
    repository = LoginRepository(loginDatasource: dataSource);
  });

  group('Testes repositório Empresas ', () {
    tHeaders
      ..add('access-token', 's8AE9vfCV63arIac4nor-w')
      ..add('client', '8D1o0HBJrw4DcMErv5MvwA')
      ..add('uid', 'testeandroid@ioasys.com.br');

    Future<void> setUpSuccess() async {
      when(
        dataSource.postLogin(
            email: anyNamed('email'), senha: anyNamed('senha')),
      ).thenAnswer(
        (_) async => Success(
          data: {},
          statusCode: 200,
          headers: tHeaders,
        ),
      );
    }

    Future<void> setUpApiError() async {
      when(
        dataSource.postLogin(
            email: anyNamed('email'), senha: anyNamed('senha')),
      ).thenAnswer(
        (_) async => ApiError(
          data: {},
          statusCode: 401,
          headers: {},
          message: '',
        ),
      );
    }

    Future<void> setUpInternetOff() async {
      when(
        dataSource.postLogin(
            email: anyNamed('email'), senha: anyNamed('senha')),
      ).thenAnswer(
        (_) async => InternetOff(),
      );
    }

    test(
        'deve conseguir logar e receber os cabeçalhos uid, access-token e client',
        () async {
      await setUpSuccess();

      final result = await repository.submeterLogin(
          email: '', senha: '');

      Headers headers;

      expect(result.isRight(), true);

      result.fold(
        (l) => null,
        (dados) => {headers = dados},
      );

      expect(headers.value('uid') != null, true);
      expect(headers.value('client') != null, true);
      expect(headers.value('access-token') != null, true);
    });

    test(
      'deve dar erro de api ao tentar logar com credenciais incorretas',
      () async {
        setUpApiError();

        final result = await repository.submeterLogin(
            email: '', senha: '');
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

        final result = await repository.submeterLogin(
            email: '', senha: '');
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
