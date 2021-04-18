import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/cabecalho_retangulo_widget.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/campo_entrada_texto_home.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/lista_empresas_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CabecalhoRetanguloWidget(),
              ListaEmpresasWidget(),
            ],
          ),
          CampoEntradaTextoHome(),
        ],
      ),
    );
  }
}
