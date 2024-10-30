import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_palette.dart';

// class AppTheme {
//   static TextTheme baseTextTheme = TextTheme(
//     displayLarge: GoogleFonts.lato(fontSize: 32, fontWeight: FontWeight.bold),
//     displayMedium: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
//     bodyLarge: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal),
//     bodyMedium: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal),
//     bodySmall: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal),
//     headlineLarge: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
//     headlineMedium:
//         GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.normal),
//     labelLarge: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
//     labelSmall: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.normal),
//   );
// }

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ColorPalette.primary,
    hintColor: ColorPalette.secondary,
    scaffoldBackgroundColor: ColorPalette.background,
    cardColor: ColorPalette.cardColor,
    shadowColor: ColorPalette.shadowColor,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: ColorPalette.appBarColor,
      iconTheme: IconThemeData(color: ColorPalette.secondary),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 4,
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorPalette.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.bottomBarColor,
      selectedItemColor: ColorPalette.secondary,
      unselectedItemColor: ColorPalette.inActiveIconColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorPalette.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorPalette.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorPalette.secondary,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // Text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: ColorPalette.primaryTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorPalette.primaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: ColorPalette.primaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: ColorPalette.secondaryTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: ColorPalette.hintTextColor,
      ),
    ),

    // Divider Theme
    dividerColor: ColorPalette.dividerColor,

    // Icon Theme
    iconTheme: const IconThemeData(
      color: ColorPalette.primary,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorPalette.secondary,
      foregroundColor: Colors.white,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: ColorPalette.accent1,
      labelStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    // Input Decoration Theme (for TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.cardColor,
      hintStyle: const TextStyle(color: ColorPalette.hintTextColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ColorPalette.dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ColorPalette.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ColorPalette.dividerColor),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light, // Set to Brightness.dark for dark theme
      primary: ColorPalette.primary,
      onPrimary: ColorPalette.white,
      secondary: ColorPalette.secondary,
      onSecondary: ColorPalette.white,
      error: ColorPalette.errorColor,
      onError: ColorPalette.white,
      surface: ColorPalette.cardColor,
      onSurface: ColorPalette.textColor,
    ),
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
