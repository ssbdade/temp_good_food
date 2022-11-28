import 'package:flutter/material.dart';
import '../common/common.dart';
import 'app_colors.dart';
import 'app_theme.dart';
import 'color_theme.dart';

final TextTheme lightTextTheme = TextTheme(
  // * Extremely large text.
  headline1: AppThemes.textStyle.copyWith(
      fontSize: size(28),
      fontWeight: FontWeight.w600,
      color: ColorsTheme.lightTextColor),
  // * Used for the date in the dialog shown by showDatePicker.
  headline2: AppThemes.textStyle.copyWith(
      fontSize: size(24),
      fontWeight: FontWeight.w500,
      color: ColorsTheme.lightTextColor),
  // * Very large text.
  headline3: AppThemes.textStyle.copyWith(
      fontSize: size(22),
      fontWeight: FontWeight.w400,
      color: ColorsTheme.lightTextColor),
  // * Large text.
  headline4: AppThemes.textStyle.copyWith(
      fontSize: size(20),
      fontWeight: FontWeight.w700,
      color: ColorsTheme.lightTextColor),
  // * Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
  headline5: AppThemes.textStyle.copyWith(
      fontSize: size(18),
      fontWeight: FontWeight.w600,
      color: ColorsTheme.lightTextColor),
  // * Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
  headline6: AppThemes.textStyle.copyWith(
      fontSize: size(16),
      fontWeight: FontWeight.w600,
      color: ColorsTheme.onBackgroundLight),
  // * Used for the primary text in lists (e.g., ListTile.title).
  subtitle1: AppThemes.textStyle.copyWith(
      fontSize: size(12),
      fontWeight: FontWeight.w400,
  ),
  // * For medium emphasis text that's a little smaller than subtitle1.
  subtitle2: AppThemes.textStyle.copyWith(
      fontSize: size(14),
      fontWeight: FontWeight.w400,
  ),
  // * Used for emphasizing text that would otherwise be bodyText2.
  bodyText1: AppThemes.textStyle
      .copyWith(fontSize: size(12),),
  // * The default text style for Material.
  bodyText2: AppThemes.textStyle.copyWith(fontSize: size(14)),
  // * Used for auxiliary text associated with images.
  caption: AppThemes.textStyle.copyWith(
      fontSize: size(12)),
  // * Used for text on ElevatedButton, TextButton and OutlinedButton.
  button: AppThemes.textStyle.copyWith(
      fontSize: size(14),
      fontWeight: FontWeight.w600),
  // * Typically used for captions or to introduce a (larger) headline.
  overline: AppThemes.textStyle.copyWith(
      fontSize: size(16),
      fontWeight: FontWeight.w600),
  //
);

ThemeData lightTheme = ThemeData(
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ColorsTheme.primaryLight;
      }
      return HexColor('#BFBFBF');
    }),
  ),
  disabledColor: HexColor('#F4F5F6'),
  primaryColor: Colors.black,
  brightness: Brightness.light,
  fontFamily: AppThemes.textStyle.copyWith.toString(),
  scaffoldBackgroundColor: ColorsTheme.backgroundLight,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorsTheme.primaryLight,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: ColorsTheme.primaryLight,
      iconTheme: IconThemeData(color: ColorsTheme.onBackgroundLight)),
  colorScheme: const ColorScheme.light(
      primary: ColorsTheme.primaryLight,
      onPrimary: ColorsTheme.onPrimaryLight,
      primaryContainer: ColorsTheme.primaryContainerLight,
      onPrimaryContainer: ColorsTheme.onPrimaryContainerLight,

      ///
      secondary: ColorsTheme.secondaryLight,
      onSecondary: ColorsTheme.onSecondaryLight,
      secondaryContainer: ColorsTheme.secondaryContainerLight,
      onSecondaryContainer: ColorsTheme.onSecondaryContainerLight,

      ///
      tertiary: ColorsTheme.tertiaryLight,
      onTertiary: ColorsTheme.onTertiaryLight,
      tertiaryContainer: ColorsTheme.onTertiaryContainerLight,
      onTertiaryContainer: ColorsTheme.onTertiaryContainerLight,

      ///
      error: ColorsTheme.errorLight,
      onError: ColorsTheme.onErrorLight,
      errorContainer: ColorsTheme.errorContainerLight,
      onErrorContainer: ColorsTheme.onErrorContainerLight,

      ///
      background: ColorsTheme.backgroundLight,
      onBackground: ColorsTheme.onBackgroundLight,

      ///
      surface: ColorsTheme.surfaceLight,
      onSurface: ColorsTheme.onSurfaceLight,
      surfaceVariant: ColorsTheme.surfaceVariantLight,
      onSurfaceVariant: ColorsTheme.onSurfaceVariantLight,

      ///
      outline: ColorsTheme.outlineLight),
  popupMenuTheme: const PopupMenuThemeData(color: ColorsTheme.primaryLight,),
  textTheme: lightTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.transparent))),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
            if (s.contains(MaterialState.disabled)) {
              return ColorsTheme.inverseSurfaceLight;
            } // Disabled text color
            return ColorsTheme.surfaceLight; // Enabled text color
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            return AppThemes.textStyle.copyWith(
                height: 1,
                color: Colors.white,
                fontSize: size(16),
                fontWeight: FontWeight.bold);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsTheme.primaryLight.withOpacity(0.5);
            } else {
              return ColorsTheme.primaryLight;
            }
          }))),
  buttonTheme: ButtonThemeData(
      disabledColor: ColorsTheme.primaryContainerLight.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: ColorsTheme.primaryContainerLight,
      textTheme: ButtonTextTheme.primary),
  unselectedWidgetColor: ColorsTheme.primaryLight,
  inputDecorationTheme: InputDecorationTheme(
    // hintStyle: AppThemes.textStyle.copyWith(
    //     color: HexColor('#777E90'),
    //     fontWeight: FontWeight.w400,
    //     fontSize: size(14),
    //     height: 22 / 14),
    // errorStyle: AppThemes.textStyle.copyWith(
    //     fontWeight: FontWeight.w600,
    //     fontSize: 0,
    //     color: ColorsTheme.errorLight),
    //prefixStyle: GoogleFonts.lato(color: ColorsTheme.lightIconColor),
    // border: OutlineInputBorder(
    //     borderSide:
    //     BorderSide(width: borderWidth, color: ColorsTheme.onBackgroundLight),
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(8.0),
    //     )),
    // enabledBorder: OutlineInputBorder(
    //   borderSide:
    //   BorderSide(color: ColorsTheme.onBackgroundLight, width: borderWidth),
    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //       color: ColorsTheme.primaryLight, width: borderWidth),
    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    // ),
    // errorBorder: const OutlineInputBorder(
    //   borderSide: BorderSide(width: 2, color: ColorsTheme.errorLight),
    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    // ),
    // focusedErrorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //       color: ColorsTheme.errorLight, width: borderWidth),
    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    // ),
    fillColor: ColorsTheme.tertiaryContainerLight,
    //focusColor: ColorsTheme.lightBorderActiveColor,
  ),
);
double borderWidth = 2.0;
