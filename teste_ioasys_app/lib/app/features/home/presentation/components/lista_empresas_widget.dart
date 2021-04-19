import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/coordinator/main_coordinator.dart';
import 'package:teste_ioasys_app/app/common/ui/empresa_titulo_imagem_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

class ListaEmpresasWidget extends StatelessWidget {
  ListaEmpresasWidget({
    @required this.empresas,
  });

  final List<Empresa> empresas;

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: empresas.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
              child: Text(
                Strings.resultadosEncontrados(empresas.length),
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
              child: EmpresaTituloImagemWidget(
                empresa: empresas[index - 1],
                borderRadius: 4.0,
                onPressed: (_) {
                  MainCoordinator.irParaDetalhesEmpresa(empresas[index - 1]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
