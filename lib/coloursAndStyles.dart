import 'package:flutter/material.dart';

class ColourPalette{
  final blue = const Color(0x903abfff);
  final lightBlue = const Color(0x90a8edfc);
  final darkBlue = const Color(0x902d3eb0);
  final green = const Color(0x901b7589);
  final orange = const Color(0x90f59e16);
  final darkViolet = const Color(0x908a80b4);
}

class HeadingStyle{
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;

  HeadingStyle({
    this.fontSize = 65,
    this.fontWeight = FontWeight.w800,
    this.color = Colors.white,
    this.fontFamily = 'InterSemiBold',
  });

  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }
}

class RegularStyle{
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;

  RegularStyle({
    this.fontSize = 15,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.white,
    this.fontFamily = 'InterRegular',
  });

  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }
}


