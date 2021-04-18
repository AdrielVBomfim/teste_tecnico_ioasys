import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_ioasys_app/app/common/ui/cores.dart';
import 'package:teste_ioasys_app/app/common/ui/icones.dart';

class CampoEntradaTextoWidget extends StatefulWidget {
  CampoEntradaTextoWidget({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onPressSuffix,
    this.obscureText = false,
    this.isInputValid = true,
    this.textController,
    this.onChanged,
  });

  final IconData prefixIcon;
  final IconData suffixIcon;
  final String hintText;
  final Function onPressSuffix;
  final bool obscureText;
  final TextEditingController textController;
  final bool isInputValid;
  final Function onChanged;

  @override
  _CampoEntradaTextoWidgetState createState() =>
      _CampoEntradaTextoWidgetState();
}

class _CampoEntradaTextoWidgetState extends State<CampoEntradaTextoWidget> {
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
        controller: widget.textController,
        textAlignVertical:
            widget.suffixIcon != null || widget.isInputValid == false
                ? TextAlignVertical.center
                : null,
        obscureText: widget.obscureText,
        style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.none),
        decoration: InputDecoration(
          enabledBorder: _bordaForm(),
          focusedBorder: _bordaForm(),
          contentPadding: EdgeInsets.only(left: 12.0),
          suffixIcon: (widget.suffixIcon != null || !widget.isInputValid)
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: GestureDetector(
                    onTapDown:
                        widget.isInputValid ? widget.onPressSuffix : null,
                    child: widget.isInputValid
                        ? Icon(
                            widget.suffixIcon,
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
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          border: InputBorder.none,
          fillColor: Colors.amber,
        ),
        cursorColor: Cores.rubi,
        cursorWidth: 1,
        onChanged: widget.onChanged,
      ),
    );
  }

  OutlineInputBorder _bordaForm() {
    if (!widget.isInputValid) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      );
    } else {
      return null;
    }
  }
}
