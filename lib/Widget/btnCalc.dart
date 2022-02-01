import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class btn_Calc extends StatelessWidget {
  final String txt;
  final int btnColor;
  final int txtColor;
  final double txtSize;
  final Function fun;

  const btn_Calc({
    Key? key,
    required this.txt,
    required this.btnColor,
    required this.txtColor,
    required this.txtSize,
    required this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            txt,
            style: GoogleFonts.averageSans(fontSize: txtSize),
          ),
          onPressed: () => {fun(txt)},
          color: Color(btnColor),
          textColor: Color(txtColor),
        ),
      ),
    );
  }
}
