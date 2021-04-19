import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_ioasys_app/app/common/ui/strings.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';

class EmpresaTituloImagemWidget extends StatelessWidget {
  const EmpresaTituloImagemWidget({
    @required this.empresa,
    this.borderRadius = 0.0,
    this.onPressed,
  });

  final Empresa empresa;
  final double borderRadius;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: onPressed,
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          color: Cores.getCorFundoItemLista(empresa.id),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CachedNetworkImage(
                imageUrl: Strings.urlBaseComEndpoint(empresa.photo),
                imageBuilder: (context, imageProvider) => Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
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
            Expanded(
              child: Text(
                empresa.enterpriseName,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
