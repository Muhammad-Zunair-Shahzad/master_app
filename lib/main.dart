// Chapter 18 (Themes | Dark Theme | System Themes)

import 'package:flutter/material.dart';
import 'package:master_app/pages/cart_page.dart';
import 'package:master_app/pages/home_page.dart';
import 'package:master_app/pages/login_page.dart';
import 'package:master_app/utils/routes.dart';
import 'package:master_app/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // NOTE1
      theme: MyThemes.lightTheme
      (context), 
      darkTheme: MyThemes.darkTheme 
      (context), 
      initialRoute: '/home', 
      routes: { 
        '/': (context) => const LogInPage(), 
        MyRoutes.homeRoute: (context) => const HomePage(),  
        MyRoutes.loginRoute: (context) => const LogInPage(),  
        MyRoutes.cartRoute: (context) => const CartPage()
      }, 
    );
  }
}

/*
NOTE1
      --> Instead of writing themeMode: ThemeMode.light or themeMode: ThemeMode.dark
      --> Allow the system theme by writing themeMode: ThemeMode.system
 */