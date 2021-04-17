import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/campo_entrada_texto_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';

class CamposEntradaLoginWidget extends StatefulWidget {
  @override
  _CamposEntradaLoginWidgetState createState() =>
      _CamposEntradaLoginWidgetState();
}

class _CamposEntradaLoginWidgetState extends State<CamposEntradaLoginWidget> {
  bool _isSenhaEscondida = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              Strings.email,
              style: GoogleFonts.rubik(
                fontSize: 14,
                color: Cores.cinzaEscura,
              ),
            ),
          ),
          CampoEntradaTextoWidget(),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              Strings.senha,
              style: GoogleFonts.rubik(
                fontSize: 14,
                color: Cores.cinzaEscura,
              ),
            ),
          ),
          CampoEntradaTextoWidget(
            obscureText: _isSenhaEscondida,
            suffixIcon:
                _isSenhaEscondida ? Icons.visibility : Icons.visibility_off,
            onPressSuffix: (_) {
              setState(() {
                _isSenhaEscondida = !_isSenhaEscondida;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(16.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Cores.rubi),
                  ),
                  onPressed: () {},
                  child: Text(
                    Strings.entrar.toUpperCase(),
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
