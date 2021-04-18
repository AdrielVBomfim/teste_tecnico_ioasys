import 'package:get_it/get_it.dart';
import 'package:teste_ioasys_app/app/features/login/data/datasources/login_datasource.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';
import 'package:teste_ioasys_app/app/features/login/data/repositories/login_repository.dart';
import 'package:teste_ioasys_app/app/features/login/domain/repositories/i_login_repository.dart';

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
}
