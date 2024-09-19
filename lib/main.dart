// Day8: Material Drawer | DevTool | ListView | NetworkImage 

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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch:Colors.deepPurple,
        useMaterial3: false,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: '/home', // Directy go to Home page fro working instead of writing password and user name again and again 
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(), // MyRoutes.homeRoute is '/home'
        MyRoutes.loginRoute: (context) => const LogInPage(), // MyRoutes.loginRoute is '/login'
      },
    );
  }
} 
