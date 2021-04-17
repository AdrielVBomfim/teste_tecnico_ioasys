import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/components/cabecalho_circular_widget.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/components/campos_entrada_login_widget.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/components/carregamento_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _isTecladoAberto = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CabecalhoCircularWidget(isTecladoAberto: _isTecladoAberto),
              CamposEntradaLoginWidget(
                isLoginValido: true,
                isSenhaValida: true,
              ),
            ],
          ),
          //Opacity(
          //  opacity: 0.8,
          //  child: Container(
          //    decoration: BoxDecoration(
          //      color: Colors.black,
          //    ),
          //  ),
          //),
          //CarregamentoWidget()
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
