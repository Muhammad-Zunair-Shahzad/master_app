// * Day12 : Local Files | Load & Decode JSON

import 'package:flutter/material.dart';
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
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme,
      initialRoute: '/home',
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(), 
        MyRoutes.loginRoute: (context) => const LogInPage(), 
      },
    );
  }
}
