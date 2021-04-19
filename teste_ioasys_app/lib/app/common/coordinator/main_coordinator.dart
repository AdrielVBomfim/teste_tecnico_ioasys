import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/routes/routes.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

abstract class MainCoordinator {
  static final _navigationKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static void irParaLogin() {
    _navigationKey.currentState
        .pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
  }

  static void irParaHome() {
    _navigationKey.currentState
        .pushNamedAndRemoveUntil(Routes.homeScreen, (route) => false);
  }

  static void irParaDetalhesEmpresa(Empresa empresa) {
    _navigationKey.currentState.pushNamed(
      Routes.detalhesEmpresaScreen,
      arguments: empresa,
    );
  }
}
