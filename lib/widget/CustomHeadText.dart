import 'package:flutter/material.dart';

class CustomHeadText extends StatelessWidget {
  CustomHeadText(
      {required this.text,
      this.Textsize = 25,
      this.fontcolor = Colors.black,
      this.fontweight = FontWeight.w400,
      this.textAlign = TextAlign.center});
  String text;
  double? Textsize;
  Color fontcolor;
  TextAlign textAlign;
  FontWeight fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Mada',
          fontSize: Textsize,
          fontWeight: fontweight,
          color: fontcolor),
      textAlign: textAlign,
    );
  }
}
