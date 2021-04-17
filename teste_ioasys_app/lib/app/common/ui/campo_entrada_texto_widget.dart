import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cores.dart';
import 'icones.dart';

class CampoEntradaTextoWidget extends StatelessWidget {
  CampoEntradaTextoWidget({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onPressSuffix,
    this.obscureText = false,
    this.isInputValid = true,
  });

  final IconData prefixIcon;
  final IconData suffixIcon;
  final String hintText;
  final Function onPressSuffix;
  final bool obscureText;
  final bool isInputValid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Cores.gainsboro,
        borderRadius: new BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        textAlignVertical: suffixIcon != null ? TextAlignVertical.center : null,
        obscureText: obscureText,
        style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.none),
        decoration: InputDecoration(
          enabledBorder: !isInputValid
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(left: 12.0),
          suffixIcon: (suffixIcon != null || !isInputValid)
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: GestureDetector(
                    onTapDown: isInputValid ? onPressSuffix : null,
                    child: isInputValid
                        ? Icon(
                            suffixIcon,
                            color: Cores.cinzaEscura,
                          )
                        : SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(Icones.iconeErro, scale: 2.5),
                          ),
                  ),
                )
              : null,
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
