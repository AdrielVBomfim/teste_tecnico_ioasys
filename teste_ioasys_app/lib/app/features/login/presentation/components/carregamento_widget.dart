import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';

class CarregamentoWidget extends StatefulWidget {
  @override
  _CarregamentoWidgetState createState() => _CarregamentoWidgetState();
}

class _CarregamentoWidgetState extends State<CarregamentoWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Center(
            child: Image.asset(Icones.arcoCarregamentoMaior, scale: 2.5),
          ),
        ),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Center(
            child: Image.asset(Icones.arcoCarregamentoMenor, scale: 2.5),
          ),
        ),
      ],
    );
  }
}
