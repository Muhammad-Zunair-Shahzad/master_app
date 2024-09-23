import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {

// Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          // This line of code retrieves the titleLarge text style from the current app's theme 
          // and applies it to the titleTextStyle....
          // Theme.of(context): This accesses the current Theme data for your app....
          // .textTheme: This provides access to predefined text styles in the app's theme, like headline, body text, and titles.
          // .titleLarge: properties such as font size, weight, and color that match the app's overall design.
        ),
      );

// Dark Theme
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
      );
}
