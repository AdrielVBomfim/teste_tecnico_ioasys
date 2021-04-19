import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/common/utils/dimensionamento_utils.dart';

class CabecalhoCircularWidget extends StatefulWidget {
  @override
  _CabecalhoCircularWidgetState createState() => _CabecalhoCircularWidgetState();
}

class _CabecalhoCircularWidgetState extends State<CabecalhoCircularWidget> with WidgetsBindingObserver {
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
      clipper: _ClipCircle(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Icones.iconeLogo, scale: 2.5),
            SizedBox(height: 18),
            if (!_isTecladoAberto)
              Text(
                Strings.bemVindoEmpresas,
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: DimensionamentoUtils.alturaCabecalhoCirculo(context, _isTecladoAberto),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: ExactAssetImage(Icones.background),
          ),
        ),
      ),
    );
  }
}

class _ClipCircle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 3 * size.height / 4)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        3 * size.height / 4,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
