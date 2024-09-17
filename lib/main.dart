// Day3: Function, Classes, Roots, Theme, Text

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
        useMaterial3: false, // latest version of Google's Material Design system
      ),
      initialRoute: '/home',
      routes: {
        '/':(context) => const LogInPage(),
        '/home':(context) => const HomePage(),
      },
    );
  }
}

/*

--> Functions 

  bringVegitables(thala: true); 
  bringVegitables(thala: true, rupees: 50); 
  bringVegitables(thala: true); 
  bringVegitables(thala: true); // bringVegitables(); | bringVegitables({bool thala ,int rupees = 100}) -> 💀 Thala not mentioned optional or explecitly.

  bringVegitables({@required thala ,int rupees = 100}) { // -c {Optional or Default Parameter}

    // Take cycle...
    // Go to Sec 16...
  }


--> Some Links
    https://stackoverflow.com/questions/75634235/primaryswatch-is-not-working-when-usematerial3-is-true


--> Route concept
    '/':(context) => new LogInPage(),
    Dart 2 automatically assumes you are creating a new instance of the class when you write: const LogInPage();
*/