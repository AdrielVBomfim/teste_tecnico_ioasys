import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/login/domain/repositories/i_login_repository.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';

class MockLoginRepository extends Mock
    implements ILoginRepository {}

void main() {
  MockLoginRepository repositoryMock;
  SubmeterLoginUsecase usecase;


  setUp(() {
    repositoryMock = MockLoginRepository();
    usecase = SubmeterLoginUsecase(repository: repositoryMock);
  });

  group('Testes do usecase de login', () {
    test('Caso de sucesso ao logar', () async {
      when(repositoryMock.submeterLogin(email: anyNamed('email'), senha: anyNamed('senha'))).thenAnswer(
            (_) async => Right(Headers()),
      );

      final result = await usecase(email: '', senha: '');

      expect(
        result,
        isA<Right<Erro, Headers>>(),
      );
    });

    test('Caso de erro ao logar', () async {
        when(repositoryMock.submeterLogin(email: anyNamed('email'), senha: anyNamed('senha'))).thenAnswer(
              (_) async => Left(Erro(
                data: {},
                statusCode: 403,
                headers: {},
                message: '',
              )),
        );

        final result = await usecase(email: '', senha: '');

        expect(
          result,
          isA<Left<Erro, Headers>>(),
        );
    });
  });
}
