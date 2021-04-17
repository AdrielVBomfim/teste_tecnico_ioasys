import 'package:dio/native_imp.dart';
import 'package:teste_ioasys_app/app/core/network/custom_dio/custom_dio_header_interceptor.dart';
import 'package:teste_ioasys_app/app/core/network/custom_dio/custom_dio_logging_interceptor.dart';
import 'custom_dio_logging_interceptor.dart';


class CustomDioCreator extends DioForNative {
  CustomDioCreator() {
    options.baseUrl = 'https://empresas.ioasys.com.br/api/v1/';
    interceptors.add(
      CustomDioHeaderInterceptor(),
    );
    interceptors.add(CustomDioLoggingInteceptor());
  }
}