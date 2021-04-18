import 'package:teste_ioasys_app/injection_container.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/repositories/iheaders_repository.dart';

class LerHeadersUsecase {
  LerHeadersUsecase({
    IHeadersRepository repository,
  }) : _repository = repository ?? dependencia<IHeadersRepository>();

  final IHeadersRepository _repository;

  Future<Map<String,String>> call() async {
    return _repository.lerHeaders();
  }
}