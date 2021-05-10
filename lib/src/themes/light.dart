import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.montserrat().fontFamily,
  ),
  primaryTextTheme: ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.montserrat().fontFamily,
  ),
  accentTextTheme: ThemeData.light().textTheme.apply(
    fontFamily: GoogleFonts.montserrat().fontFamily,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue.shade700,
    unselectedItemColor: Colors.grey.shade600,
    selectedLabelStyle: GoogleFonts.montserrat(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2
    ),
    unselectedLabelStyle: GoogleFonts.montserrat(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2
    ),
  ),

  dividerTheme: DividerThemeData(
    color: Colors.grey.shade600,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue.shade700,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  ),

  iconTheme: IconThemeData(
    color: Colors.grey.shade700,
  ),
);
