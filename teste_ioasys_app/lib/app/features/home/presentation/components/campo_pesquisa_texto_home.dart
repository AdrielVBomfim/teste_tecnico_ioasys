import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ioasys_app/app/common/ui/campo_entrada_texto_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/common/utils/dimensionamento_utils.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/cubit/home_cubit.dart';

class CampoPesquisaTextoWidget extends StatefulWidget {
  @override
  _CampoPesquisaTextoWidgetState createState() =>
      _CampoPesquisaTextoWidgetState();
}

class _CampoPesquisaTextoWidgetState extends State<CampoPesquisaTextoWidget>
    with WidgetsBindingObserver {
  Timer _debounce;
  String _queryAnterior = '';
  bool _isTecladoAberto = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _debounce?.cancel();
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

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query != _queryAnterior) {
        _queryAnterior = query;
        BlocProvider.of<HomeCubit>(context)
            .consultarEmpresas(consultaNome: query.toLowerCase());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: DimensionamentoUtils.alturaTextoCabecalhoRetangulo(
            context, _isTecladoAberto),
      ),
      child: CampoEntradaTextoWidget(
        prefixIcon: Icons.search,
        fontSize: 18,
        opacity: 0.7,
        hintText: Strings.pesquisePorEmpresa,
        onChanged: _onSearchChanged,
      ),
    );
  }
}
