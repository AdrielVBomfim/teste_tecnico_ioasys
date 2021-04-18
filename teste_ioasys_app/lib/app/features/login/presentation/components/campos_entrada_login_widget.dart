import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/campo_entrada_texto_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/cubit/login_cubit.dart';
import 'package:teste_ioasys_app/app/features/login/utils/email_validator.dart';

class CamposEntradaLoginWidget extends StatefulWidget {
  const CamposEntradaLoginWidget({
    @required this.isCredenciaisValidas,
    this.mensagemErro = '',
  });

  final bool isCredenciaisValidas;
  final String mensagemErro;

  @override
  _CamposEntradaLoginWidgetState createState() =>
      _CamposEntradaLoginWidgetState();
}

class _CamposEntradaLoginWidgetState extends State<CamposEntradaLoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool _isSenhaEscondida = true;
  bool _isSubmissaoHabilitada = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          CampoEntradaTextoWidget(
            textController: emailController,
            isInputValid: widget.isCredenciaisValidas,
            onChanged: (_) {
              _avaliarValidacaoFormComSubmissao();
            },
          ),
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
            textController: senhaController,
            obscureText: _isSenhaEscondida,
            suffixIcon:
                _isSenhaEscondida ? Icons.visibility : Icons.visibility_off,
            onPressSuffix: (_) {
              setState(() {
                _isSenhaEscondida = !_isSenhaEscondida;
              });
            },
            isInputValid: widget.isCredenciaisValidas,
            onChanged: (_) {
              _avaliarValidacaoFormComSubmissao();
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 4, top: 4),
            child: Text(
              widget.mensagemErro,
              textAlign: TextAlign.end,
              style: GoogleFonts.rubik(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.red,
              ),
            ),
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _isSubmissaoHabilitada ? Cores.rubi : Cores.gainsboro),
                  ),
                  onPressed: _isSubmissaoHabilitada
                      ? () {
                          FocusScope.of(context).unfocus();
                          BlocProvider.of<LoginCubit>(context).submeterLogin(
                              emailController.text, senhaController.text);
                        }
                      : null,
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

  void _avaliarValidacaoFormComSubmissao() {
    BlocProvider.of<LoginCubit>(context).emit(LoginInitial());

    if (EmailValidator.validate(emailController.text) &&
        senhaController.text.length >= 6) {
      setState(() {
        _isSubmissaoHabilitada = true;
      });
    } else {
      setState(() {
        _isSubmissaoHabilitada = false;
      });
    }
  }
}
