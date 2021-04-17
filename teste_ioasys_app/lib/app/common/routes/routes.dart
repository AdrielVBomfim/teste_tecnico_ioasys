import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/pages/home_screen.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/pages/login_screen.dart';
import 'package:teste_ioasys_app/app/features/splash/presentation/pages/splash_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';

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
    }

    return MaterialPageRoute<dynamic>(builder: builder, settings: settings);
  }
}