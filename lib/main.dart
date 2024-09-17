// Day4: Adding Images, Googe Fonts, Elevated Button, Log in Page

import 'package:flutter/material.dart';
import 'package:master_app/pages/home_page.dart';
import 'package:master_app/pages/login_page.dart';

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
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const LogInPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
