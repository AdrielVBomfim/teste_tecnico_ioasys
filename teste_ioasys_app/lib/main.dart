import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/injection_container.dart' as injection;
import 'package:teste_ioasys_app/ioasys_app.dart';

void main() async {
  await injection.init();
  runApp(IoasysApp());
}
