import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/home/domain/usecases/consultar_empresas_usecase.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/cubit/home_cubit.dart';

class MockConsultarEmpresasUsecase extends Mock implements ConsultarEmpresasUsecase {}

void main() {
  MockConsultarEmpresasUsecase useCase;
  HomeCubit cubit;

  setUp(() {
    useCase = MockConsultarEmpresasUsecase();

    cubit = HomeCubit(
      consultarEmpresasUsecase: useCase,
    );
  });

  tearDown(
        () => cubit.close(),
  );

  group('Testes HomeCubit', () {
    test('Deve emitir HomeInitial como estado inicial', () {
      expect(cubit.state, HomeInitial());
    });

    blocTest<HomeCubit, HomeState>(
      'Deve verificar se deu sucesso ao consultar empresas',
      build: () {
        when(useCase())
            .thenAnswer(
              (_) async => Right([]),
        );
        return cubit;
      },
      act: (cubit) async => cubit.consultarEmpresas(),
      expect: () => <HomeState>[
        HomeCarregando(),
        HomeCarregado(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'Deve verificar se deu erro ao consultar empresas',
      build: () {
        when(useCase())
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
      act: (cubit) async => cubit.consultarEmpresas(),
      expect: () => <HomeState>[
        HomeCarregando(),
        HomeErro(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'Deve verificar se dá erro com credenciais inválidas',
      build: () {
        when(useCase())
            .thenAnswer(
              (_) async => Left(Erro(
            data: {},
            statusCode: 401,
            headers: {},
            message: '',
          )),
        );
        return cubit;
      },
      act: (cubit) async => cubit.consultarEmpresas(),
      expect: () => <HomeState>[
        HomeCarregando(),
        HomeFalhaCredenciais(),
      ],
    );
  });
}
