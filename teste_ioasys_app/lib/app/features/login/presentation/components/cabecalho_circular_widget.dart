import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';

class CabecalhoCircularWidget extends StatelessWidget {
  const CabecalhoCircularWidget({
    @required this.isTecladoAberto,
  });

  final bool isTecladoAberto;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ClipCircle(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Icones.iconeLogo, scale: 2.5),
            SizedBox(height: 18),
            if (!isTecladoAberto)
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
        height:
            MediaQuery.of(context).size.height * (isTecladoAberto ? 0.20 : 0.35),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
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
