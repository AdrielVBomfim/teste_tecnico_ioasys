import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/detalhes_empresa/presentation/pages/detalhes_empresa_screen.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/pages/home_screen.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/pages/login_screen.dart';
import 'package:teste_ioasys_app/app/features/splash/presentation/pages/splash_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';
  static const detalhesEmpresaScreen = '/detalhesEmpresa';

  static Route onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case splashScreen:
        builder = (_) {
          return SplashScreen();
        };
        break;
      case loginScreen:
        builder = (_) {
          return LoginScreen();
        };
        break;
      case homeScreen:
        builder = (_) {
          return HomeScreen();
        };
        break;
      case detalhesEmpresaScreen:
        builder = (_) {
          return DetalhesEmpresaScreen(
            empresa: settings.arguments,
          );
        };
        break;
    }

    return MaterialPageRoute<dynamic>(builder: builder, settings: settings);
  }
}
