import 'package:flutter/material.dart';

const Color white = Colors.white;

abstract class AppColors {
  static Color oliveGreen800 = HexColor("#356869");
  static Color oliveGreen500 = HexColor("#37966F");
  static Color oliveGreen100 = HexColor("#B9E4C9");
  static Color orange = HexColor("#FD5523");
  static Color cornSilk = HexColor("#FFFBE6");

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color lightPurple = HexColor('#AEA1E6');
  static Color darkPurple = HexColor('#56549E');
  static Color red = HexColor('#FF4D58');
  static Color blue = HexColor('#4D79FF');
  static Color gray = HexColor('#EBF1FF');
  static Color switchBg = HexColor('#473F97').withOpacity(0.15);
  static Color grayBottomNav = HexColor('#999FBF');
  


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
