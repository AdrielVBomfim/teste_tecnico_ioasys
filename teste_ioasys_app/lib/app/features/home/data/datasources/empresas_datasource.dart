import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/core/network/http_methods.dart';
import 'package:teste_ioasys_app/app/core/network/request_handler.dart';

class EmpresasDatasource {
  Future<ApiResult> getEmpresas({String consultaNome}) async {
    return await RequestHandler.request(
      httpMethod: Get(
        url: 'enterprises${consultaNome != null ? '?name=$consultaNome' : ''}',
      ),
    );
  }
}
