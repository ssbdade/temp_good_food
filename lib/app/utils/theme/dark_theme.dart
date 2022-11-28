import 'package:temp_good_food/app/utils/theme/app_theme.dart';
import 'package:temp_good_food/app/utils/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/screen_util.dart';

final TextTheme darkTextTheme = TextTheme(
  // * Extremely large text.
  headline1: AppThemes.textStyle.copyWith(
      fontSize: size(28.0),
      fontWeight: FontWeight.w600,
      color: ColorsTheme.onSurfaceDark),
  // * Used for the date in the dialog shown by showDatePicker.
  headline2: AppThemes.textStyle.copyWith(
      fontSize: size(24.0), fontWeight: FontWeight.w500, color: Colors.blue),
  // * Very large text.
  headline3: AppThemes.textStyle.copyWith(
      fontSize: size(22.0), fontWeight: FontWeight.w400, color: Colors.orange),
  // * Large text.
  headline4: AppThemes.textStyle.copyWith(
      fontSize: size(20.0), fontWeight: FontWeight.w700, color: Colors.white),
  // * Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
  headline5: AppThemes.textStyle.copyWith(
      fontSize: size(18.0),
      fontWeight: FontWeight.w200,
      color: ColorsTheme.onSurfaceDark),
  // * Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
  headline6: AppThemes.textStyle.copyWith(
      fontSize: size(16.0),
      fontWeight: FontWeight.w800,
      color: ColorsTheme.onSurfaceDark),
  // * Used for the primary text in lists (e.g., ListTile.title).
  subtitle1: AppThemes.textStyle.copyWith(
      fontSize: size(12.0),
      fontWeight: FontWeight.normal,
      color: ColorsTheme.onSurfaceDark
      ),
  // * For medium emphasis text that's a little smaller than subtitle1.
  subtitle2: AppThemes.textStyle.copyWith(
      fontSize: size(14.0),
      fontWeight: FontWeight.normal,
      color: ColorsTheme.onSurfaceDark
  ),
  // * Used for emphasizing text that would otherwise be bodyText2.
  bodyText1: AppThemes.textStyle
      .copyWith(fontSize: size(12.0), color: ColorsTheme.onSurfaceDark),
  // * The default text style for Material.
  bodyText2: AppThemes.textStyle
      .copyWith(fontSize: size(14.0), color: ColorsTheme.onSurfaceDark),
  // * Used for auxiliary text associated with images.
  caption: AppThemes.textStyle.copyWith(
      fontSize: size(12.0), color: ColorsTheme.primaryDark),
  // * Used for text on ElevatedButton, TextButton and OutlinedButton.
  button: AppThemes.textStyle.copyWith(
      fontSize: size(14.0),
      color: ColorsTheme.primaryDark,
      fontWeight: FontWeight.w600),
  // * Typically used for captions or to introduce a (larger) headline.
  overline: AppThemes.textStyle.copyWith(
      fontSize: size(16.0),
      color: ColorsTheme.onSurfaceDark,
      fontWeight: FontWeight.w600),
);

//the dark theme
ThemeData darkTheme = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  brightness: Brightness.dark,
  fontFamily: AppThemes.textStyle.copyWith.toString(),
  scaffoldBackgroundColor: ColorsTheme.backgroundDark,
  backgroundColor: ColorsTheme.backgroundDark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorsTheme.backgroundDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
            if (s.contains(MaterialState.disabled)) {
              return ColorsTheme.inversePrimaryDark;
            } // Disabled text color
            return ColorsTheme.surfaceLight; // Enabled text color
          }), textStyle: MaterialStateProperty.resolveWith((states) {
        return AppThemes.textStyle.copyWith(
            height: 0.9,
            color: Colors.white,
            fontSize: size(16),
            fontWeight: FontWeight.bold);
      }), backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorsTheme.primaryDark.withOpacity(0.5);
        } else {
          return ColorsTheme.primaryDark;
        }
      }))),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsTheme.primaryDark,
    actionsIconTheme: const IconThemeData(
      color: ColorsTheme.onBackgroundDark,
      opacity: 100,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    // backgroundColor: MaterialDarkColors.surfaceDark,
    foregroundColor: ColorsTheme.onSurfaceDark,
    shadowColor: ColorsTheme.surfaceDark.withAlpha(80),
    iconTheme: const IconThemeData(
      // color: MaterialDarkColors.onSurfaceDark,
      color: ColorsTheme.onSurfaceDark,
      opacity: 0.7,
    ),
    // toolbarTextStyle: TextStyle(
    //   color: Colors.red,
    // ),
    // titleTextStyle: TextStyle(
    //   color: MaterialDarkColors.onSurfaceDark,
    // )
  ),
  cardTheme: const CardTheme(
    color: ColorsTheme.surfaceDark,
  ),
  colorScheme: const ColorScheme.dark(
      primary: ColorsTheme.primaryDark,
      onPrimary: ColorsTheme.onPrimaryDark,
      primaryContainer: ColorsTheme.primaryContainerDark,
      onPrimaryContainer: ColorsTheme.onPrimaryContainerDark,

      ///
      secondary: ColorsTheme.secondaryDark,
      onSecondary: ColorsTheme.onSecondaryDark,
      secondaryContainer: ColorsTheme.secondaryContainerDark,
      onSecondaryContainer: ColorsTheme.onSecondaryContainerDark,

      ///
      tertiary: ColorsTheme.tertiaryDark,
      onTertiary: ColorsTheme.onTertiaryDark,
      tertiaryContainer: ColorsTheme.tertiaryContainerDark,
      onTertiaryContainer: ColorsTheme.onTertiaryContainerDark,

      ///
      error: ColorsTheme.errorDark,
      onError: ColorsTheme.onErrorDark,
      errorContainer: ColorsTheme.errorContainerDark,
      onErrorContainer: ColorsTheme.onErrorContainerDark,

      ///
      background: ColorsTheme.backgroundDark,
      onBackground: ColorsTheme.onBackgroundDark,
      surface: ColorsTheme.surfaceDark,
      onSurface: ColorsTheme.onSurfaceDark,

      ///
      surfaceVariant: ColorsTheme.surfaceVariantDark,
      onSurfaceVariant: ColorsTheme.onSurfaceVariantDark,
      outline: ColorsTheme.outlineDark),
  iconTheme: const IconThemeData(
    color: ColorsTheme.backgroundDark, //ColorsTheme.darkIconColor,
  ),
  popupMenuTheme:
  const PopupMenuThemeData(color: ColorsTheme.primaryDark),
  textTheme: darkTextTheme,
  buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: ColorsTheme.primaryDark,
      textTheme: ButtonTextTheme.primary),
  unselectedWidgetColor: ColorsTheme.primaryDark,
  // inputDecorationTheme: InputDecorationTheme(
  //   errorStyle: AppThemes.textStyle.copyWith(
  //       fontWeight: FontWeight.w600,
  //       fontSize: 0,
  //       color: ColorsTheme.errorLight),
  //   //labelStyle: GoogleFonts.lato(color: nevada),
  //   enabledBorder: const OutlineInputBorder(
  //     borderSide:  BorderSide(color: ColorsTheme.onBackgroundDark, width: 1.0),
  //     borderRadius: BorderRadius.all( Radius.circular(8.0)),
  //   ),
  //   focusedBorder: const OutlineInputBorder(
  //     borderSide:  BorderSide(color: ColorsTheme.primaryDark),
  //     borderRadius:  BorderRadius.all( Radius.circular(8.0)),
  //   ),
  //   errorBorder: const OutlineInputBorder(
  //     borderSide:  BorderSide(color: ColorsTheme.errorDark),
  //     borderRadius:  BorderRadius.all( Radius.circular(8.0)),
  //   ),
  //   focusedErrorBorder: const OutlineInputBorder(
  //     borderSide:  BorderSide(color: ColorsTheme.errorDark),
  //     borderRadius:  BorderRadius.all(Radius.circular(8.0)),
  //   ),
  //   fillColor: ColorsTheme.tertiaryContainerDark,
  //   //focusColor: ColorsTheme.darkBorderActiveColor,
  // ),
);
