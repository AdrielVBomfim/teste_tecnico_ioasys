import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';

class ListaEmpresasWidget extends StatelessWidget {
  List<Color> _coresFundoItemLista = [
    Cores.rubi,
    Cores.florBiloba,
    Cores.areiasTahuna,
    Cores.orchideaEscura,
    Cores.gaivotaMarinha,
    Cores.chocante,
    Cores.rosaDoce,
    Cores.verdeMarinhoEscuro,
  ];

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 11,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
              child: Text(
                Strings.resultadosEncontrados(4),
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
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: _getCorFundoItemLista(index),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://empresas.ioasys.com.br//uploads/enterprise/photo/1/240.jpeg',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[200],
                          highlightColor: Colors.grey[350],
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Empresa X',
                      style: GoogleFonts.rubik(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Color _getCorFundoItemLista(int index) {
    return _coresFundoItemLista[index % _coresFundoItemLista.length];
  }
}
