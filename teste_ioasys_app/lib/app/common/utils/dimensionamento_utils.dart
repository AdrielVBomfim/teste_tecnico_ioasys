import 'package:flutter/cupertino.dart';

abstract class DimensionamentoUtils {
  static bool isTecladoAberto(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0.0;
  }

  static double alturaCabecalhoCirculo(BuildContext context) {
    return MediaQuery.of(context).size.height *
        (isTecladoAberto(context) ? 0.2: 0.35);
  }

  static double alturaCabecalhoRetangulo(BuildContext context) {
    return MediaQuery.of(context).size.height *
        (isTecladoAberto(context) ? 0.075 : 0.25);
  }

  static double alturaTextoCabecalhoRetangulo(BuildContext context) {
    return alturaCabecalhoRetangulo(context) - 24;
  }
}
