// Day7: Form | TextField Validation | Ink 

import 'package:flutter/material.dart';
import 'package:master_app/pages/home_page.dart';
import 'package:master_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: false,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LogInPage(),
      },
    );
  }
} 