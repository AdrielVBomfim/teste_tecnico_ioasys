import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cores.dart';

class CampoEntradaTextoWidget extends StatelessWidget {
  CampoEntradaTextoWidget({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onPressSuffix,
    this.obscureText = false,
  });

  final IconData prefixIcon;
  final IconData suffixIcon;
  final String hintText;
  final Function onPressSuffix;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Cores.gainsboro,
          borderRadius: new BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.none
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12.0),
          suffixIcon: GestureDetector(
            onTapDown: onPressSuffix,
            child: Icon(
              suffixIcon,
              color: Cores.cinzaEscura,
            ),
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: InputBorder.none,
          fillColor: Colors.amber,
        ),
        cursorColor: Cores.rubi,
        cursorWidth: 1,
        onSaved: (String value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}
