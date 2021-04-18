import 'package:flutter/cupertino.dart';

abstract class DimensionamentoUtils {
  static double alturaCabecalhoCirculo(BuildContext context, bool isTecladoAberto) {
    return MediaQuery.of(context).size.height *
        (isTecladoAberto ? 0.2: 0.35);
  }

  static double alturaCabecalhoRetangulo(BuildContext context, bool isTecladoAberto) {
    return MediaQuery.of(context).size.height *
        (isTecladoAberto ? 0.075 : 0.25);
  }

  static double alturaTextoCabecalhoRetangulo(BuildContext context, bool isTecladoAberto) {
    return alturaCabecalhoRetangulo(context, isTecladoAberto) - 24;
  }
}
