import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

class InformacoesEmpresaWidget extends StatelessWidget {
  const InformacoesEmpresaWidget({@required this.empresa});

  final Empresa empresa;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: Text(
            empresa.description,
            style: GoogleFonts.rubik(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.briefcase,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              '${empresa.enterpriseType.enterpriseTypeName}',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.city,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              '${empresa.city}, ${empresa.country}',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.currencyUsd,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              '${empresa.value}',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.accountCash,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              '${empresa.sharePrice}',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.email,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              empresa.emailEnterprise ?? '',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.twitter,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              empresa.twitter ?? '',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.linkedin,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              empresa.linkedin ?? '',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                MdiIcons.phone,
                color: Cores.cinzaEscura,
              ),
            ),
            Text(
              empresa.phone ?? '',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ],
    );
  }
}