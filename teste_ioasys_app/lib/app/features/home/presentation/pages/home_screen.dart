import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/cabecalho_retangulo_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CabecalhoRetanguloWidget(),
            ],
          ),
        ],
      ),
    );
  }
}