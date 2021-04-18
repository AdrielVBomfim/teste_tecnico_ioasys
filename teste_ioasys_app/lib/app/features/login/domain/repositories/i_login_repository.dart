import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';

abstract class ILoginRepository {
  Future<Either<Erro, bool>> submeterLogin({
    @required String email,
    @required String senha,
  });
}
