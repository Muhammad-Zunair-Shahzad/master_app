import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
// Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
      );

// Dark Theme
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
      );

  // Other colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}
