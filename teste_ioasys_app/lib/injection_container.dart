import 'package:get_it/get_it.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/usecases/gravar_headers_usecase.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/usecases/ler_headers_usecase.dart';
import 'package:teste_ioasys_app/app/features/home/data/datasources/empresas_datasource.dart';
import 'package:teste_ioasys_app/app/features/home/domain/repositories/i_empresas_repository.dart';
import 'package:teste_ioasys_app/app/features/home/domain/usecases/consultar_empresas_usecase.dart';
import 'package:teste_ioasys_app/app/features/login/data/datasources/login_datasource.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';
import 'package:teste_ioasys_app/app/features/login/data/repositories/login_repository.dart';
import 'package:teste_ioasys_app/app/features/login/domain/repositories/i_login_repository.dart';
import 'app/common/headers/data/datasources/headers_datasource.dart';
import 'app/common/headers/data/repositories/headers_repository.dart';
import 'app/common/headers/domain/repositories/iheaders_repository.dart';
import 'app/features/home/data/repositories/empresas_repository.dart';

final dependencia = GetIt.instance;

Future<void> init() async {
  dependencia.registerLazySingleton<LoginDatasource>(
    () => LoginDatasource(),
  );

  dependencia.registerLazySingleton<ILoginRepository>(
    () => LoginRepository(
      loginDatasource: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<SubmeterLoginUsecase>(
    () => SubmeterLoginUsecase(
      repository: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<HeadersDatasource>(
    () => HeadersDatasource(),
  );

  dependencia.registerLazySingleton<IHeadersRepository>(
    () => HeadersRepository(
      headersDatasource: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<GravarHeadersUsecase>(
    () => GravarHeadersUsecase(
      repository: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<LerHeadersUsecase>(
        () => LerHeadersUsecase(
      repository: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<EmpresasDatasource>(
        () => EmpresasDatasource(),
  );

  dependencia.registerLazySingleton<IEmpresasRepository>(
        () => EmpresasRepository(
      empresasDatasource: dependencia(),
    ),
  );

  dependencia.registerLazySingleton<ConsultarEmpresasUsecase>(
        () => ConsultarEmpresasUsecase(
      repository: dependencia(),
    ),
  );
}
