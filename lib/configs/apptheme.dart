import 'package:chinese_flashcard/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData apptheme = ThemeData(
    primaryColor: kRed,
    appBarTheme: AppBarTheme(
        color: kRed,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: GoogleFonts.notoSans().fontFamily,
          fontWeight: FontWeight.bold,
        )),
    textTheme: TextTheme(
        bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 18,
    )),
    scaffoldBackgroundColor: kYellow
    // accentColor: kGreen,
    );
