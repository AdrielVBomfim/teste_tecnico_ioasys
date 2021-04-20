import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/repositories/iheaders_repository.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/cubit/login_cubit.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';

class MockSubmeterLoginUseCase extends Mock implements SubmeterLoginUsecase {}

class MockIHeadersRepository extends Mock implements IHeadersRepository {}

void main() {
  MockSubmeterLoginUseCase useCase;
  MockIHeadersRepository repository;
  LoginCubit cubit;

  setUp(() {
    useCase = MockSubmeterLoginUseCase();
    repository = MockIHeadersRepository();
    cubit = LoginCubit(
      submeterLoginUsecase: useCase,
      iHeadersRepository: repository,
    );
  });

  tearDown(
    () => cubit.close(),
  );

  group('Testes LoginCubit', () {
    test('Deve emitir LoginInitial como estado inicial', () {
      expect(cubit.state, LoginInitial());
    });

    blocTest<LoginCubit, LoginState>(
      'Deve verificar se deu sucesso ao logar',
      build: () {
        when(useCase(email: anyNamed('email'), senha: anyNamed('senha')))
            .thenAnswer(
          (_) async => Right(Headers()),
        );
        return cubit;
      },
      act: (cubit) async => cubit.submeterLogin('', ''),
      expect: () => <LoginState>[
        LoginCarregando(),
        LoginSucesso(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'Deve verificar se deu erro ao logar',
      build: () {
        when(useCase(email: anyNamed('email'), senha: anyNamed('senha')))
            .thenAnswer(
          (_) async => Left(Erro(
            data: {},
            statusCode: 403,
            headers: {},
            message: '',
          )),
        );
        return cubit;
      },
      act: (cubit) async => cubit.submeterLogin('', ''),
      expect: () => <LoginState>[
        LoginCarregando(),
        LoginErro(),
      ],
    );
  });
}
