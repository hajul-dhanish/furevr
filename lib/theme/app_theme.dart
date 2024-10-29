import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_palette.dart';

class AppTheme {
  static TextTheme baseTextTheme = TextTheme(
    displayLarge: GoogleFonts.lato(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal),
    headlineLarge: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
    headlineMedium:
        GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
    labelSmall: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.normal),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorPalette.primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ColorPalette.primary,
      secondary: ColorPalette.secondary,
      background: ColorPalette.lightBackgroundColor,
      onBackground: ColorPalette.lightTextColor,
    ),
    scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
    textTheme: baseTextTheme.apply(
        bodyColor: ColorPalette.lightTextColor,
        displayColor: ColorPalette.lightTextColor),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorPalette.primary,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: ColorPalette.primary,
      secondary: ColorPalette.secondary,
      background: ColorPalette.darkBackgroundColor,
      onBackground: ColorPalette.darkTextColor,
    ),
    scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
    textTheme: baseTextTheme.apply(
        bodyColor: ColorPalette.darkTextColor,
        displayColor: ColorPalette.darkTextColor),
  );
}

extension CustomTextStyles on TextTheme {
  static TextStyle get bodyBold =>
      GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle get bodyDefault =>
      GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle get headingBold =>
      GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle get headingNormal =>
      GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.normal);
  static TextStyle get captionBold =>
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle get captionNormal =>
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal);
  static TextStyle get bodyThin =>
      GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w300);
}
