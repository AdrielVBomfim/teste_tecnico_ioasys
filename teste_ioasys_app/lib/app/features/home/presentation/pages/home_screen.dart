import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/carregamento_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/cabecalho_retangulo_widget.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/campo_pesquisa_texto_home.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/components/lista_empresas_widget.dart';
import 'package:teste_ioasys_app/app/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..consultarEmpresas(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeCarregando) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CabecalhoRetanguloWidget(),
                      _widgetCentroTela(
                        child: CarregamentoWidget(),
                      ),
                    ],
                  ),
                  CampoPesquisaTextoWidget(),
                ],
              );
            }

            if (state is HomeCarregado) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CabecalhoRetanguloWidget(),
                      state.empresas.length > 0
                          ? ListaEmpresasWidget(empresas: state.empresas)
                          : _widgetCentroTela(
                              child: Text(
                                Strings.nenhumResultado,
                                style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Cores.cinzaEscura),
                              ),
                            ),
                    ],
                  ),
                  CampoPesquisaTextoWidget(),
                ],
              );
            }

            if (state is HomeErro) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CabecalhoRetanguloWidget(),
                      _widgetCentroTela(
                        child: Text(
                          state.mensagemErro,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Cores.cinzaEscura),
                        ),
                      )
                    ],
                  ),
                  CampoPesquisaTextoWidget(),
                ],
              );
            }

            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CabecalhoRetanguloWidget(),
                  ],
                ),
                CampoPesquisaTextoWidget(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _widgetCentroTela({Widget child}) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
