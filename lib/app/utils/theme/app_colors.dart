import 'package:flutter/material.dart';

const Color white = Colors.white;

abstract class AppColors {
  static Color oliveGreen800 = HexColor("#356869");
  static Color oliveGreen500 = HexColor("#37966F");
  static Color oliveGreen100 = HexColor("#B9E4C9");
  static Color orange = HexColor("#FD5523");
  static Color cornSilk = HexColor("#FFFBE6");
}




class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
