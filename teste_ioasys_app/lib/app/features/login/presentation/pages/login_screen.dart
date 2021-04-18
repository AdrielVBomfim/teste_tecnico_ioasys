import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/components/cabecalho_circular_widget.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/components/campos_entrada_login_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/carregamento_widget.dart';
import 'package:teste_ioasys_app/app/features/login/presentation/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    CabecalhoCircularWidget(),
                    CamposEntradaLoginWidget(
                      isCredenciaisValidas: !(state is LoginErro),
                      mensagemErro: _mensagemErroForm(state),
                    ),
                  ],
                ),
                if (state is LoginCarregando)
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (state is LoginCarregando) CarregamentoWidget()
              ],
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String _mensagemErroForm(LoginState state) {
    if (state is LoginErro) {
      return state.mensagemErro;
    } else {
      return '';
    }
  }
}
