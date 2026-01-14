import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static final AppButtonTheme instance = AppButtonTheme._();

  ElevatedButtonThemeData get elevatedButtonStyle => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      minimumSize: const Size(double.infinity, 54),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      textStyle: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  OutlinedButtonThemeData get outlinedButtonStyle => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 54),
      foregroundColor: Colors.black,
      side: const BorderSide(width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      textStyle: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  TextButtonThemeData get textButtonStyle => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}
