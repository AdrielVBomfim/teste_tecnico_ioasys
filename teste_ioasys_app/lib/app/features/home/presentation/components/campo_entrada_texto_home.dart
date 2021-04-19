import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/campo_entrada_texto_widget.dart';
import 'package:teste_ioasys_app/app/common/utils/dimensionamento_utils.dart';

class CampoEntradaTextoHome extends StatefulWidget {
  @override
  _CampoEntradaTextoHomeState createState() => _CampoEntradaTextoHomeState();
}

class _CampoEntradaTextoHomeState extends State<CampoEntradaTextoHome>
    with WidgetsBindingObserver {
  bool _isTecladoAberto = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isTecladoAberto) {
      setState(() {
        _isTecladoAberto = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: DimensionamentoUtils.alturaTextoCabecalhoRetangulo(
            context, _isTecladoAberto),
      ),
      child: CampoEntradaTextoWidget(
        prefixIcon: Icons.search,
        fontSize: 18,
        opacity: 0.7,
      ),
    );
  }
}
