import 'package:flutter/material.dart';
import 'light_theme.dart' as LightTheme;
import 'dark_theme.dart' as DarkTheme;

class AppThemes {
  AppThemes._();
  static final textStyle = TextStyle(fontFamily: 'MyriadPro');
  static final ThemeData lightTheme = LightTheme.lightTheme;
  static final ThemeData darkTheme = DarkTheme.darkTheme;
}
