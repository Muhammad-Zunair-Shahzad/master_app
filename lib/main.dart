import 'package:flutter/material.dart';
import 'package:master_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Make a Black Screen with an (ugly black red Text) we write...
        home: HomePage()
      );
  }
}
