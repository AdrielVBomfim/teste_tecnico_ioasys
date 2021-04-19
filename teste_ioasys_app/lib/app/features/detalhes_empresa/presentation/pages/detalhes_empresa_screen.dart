import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/features/detalhes_empresa/presentation/components/informacoes_empresa_widget.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/empresa_titulo_imagem_widget.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

class DetalhesEmpresaScreen extends StatelessWidget {
  const DetalhesEmpresaScreen({@required this.empresa});

  final Empresa empresa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Cores.fumacaBranca,
              borderRadius: new BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Cores.rubi,
              ),
            ),
          ),
        ),
        title: Text(
          empresa.enterpriseName,
          style: GoogleFonts.rubik(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EmpresaTituloImagemWidget(
              empresa: empresa,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                left: 16.0,
                right: 16.0,
              ),
              child: InformacoesEmpresaWidget(
                empresa: empresa,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
