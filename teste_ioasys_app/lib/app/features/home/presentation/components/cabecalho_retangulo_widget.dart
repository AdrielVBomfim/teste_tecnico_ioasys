import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';
import 'package:teste_ioasys_app/app/common/utils/dimensionamento_utils.dart';

class CabecalhoRetanguloWidget extends StatefulWidget {
  @override
  _CabecalhoRetanguloWidgetState createState() =>
      _CabecalhoRetanguloWidgetState();
}

class _CabecalhoRetanguloWidgetState extends State<CabecalhoRetanguloWidget>
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
    return ClipPath(
      clipper: _ClipRectangle(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: DimensionamentoUtils.alturaCabecalhoRetangulo(
            context, _isTecladoAberto),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(Icones.background),
          ),
        ),
        child: AnimatedOpacity(
          curve: _isTecladoAberto ? Curves.easeOutCirc : Curves.easeInCirc,
          duration: Duration(milliseconds: 250),
          opacity: _isTecladoAberto ? 0.0 : 1.0,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Transform.translate(
                  offset: Offset(0.0, 20.0),
                  child: Image.asset(
                    Icones.iconeLogoApagado1,
                    scale: 4.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Image.asset(
                    Icones.iconeLogoApagado4,
                    scale: 3.5,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.7, 0.0),
                child: Image.asset(
                  Icones.iconeLogoApagado3,
                  scale: 3.5,
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 20.0),
                child: Align(
                  alignment: Alignment(0.6, 1.0),
                  child: Image.asset(
                    Icones.iconeLogoApagado2,
                    scale: 3.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClipRectangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
