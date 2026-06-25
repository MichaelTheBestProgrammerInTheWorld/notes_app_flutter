import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Montserrat for headlines
  static final String _headlineFont = GoogleFonts.montserrat().fontFamily!;
  // Roboto for body
  static final String _bodyFont = GoogleFonts.roboto().fontFamily!;

  static ThemeData light() {
    return FlexThemeData.light(
      scheme: FlexScheme.purpleBrown,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        cardRadius: 28.0,
        containerRadius: 28.0,
        fabRadius: 20.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyColors: true,
      fontFamily: _bodyFont,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        titleSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
      ),
    );
  }

  static ThemeData dark() {
    return FlexThemeData.dark(
      scheme: FlexScheme.purpleBrown,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        cardRadius: 28.0,
        containerRadius: 28.0,
        fabRadius: 20.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyColors: true,
      fontFamily: _bodyFont,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        headlineLarge: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white),
        titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.white),
        titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.white),
        titleSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
