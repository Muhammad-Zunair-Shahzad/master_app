import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material( // To avoid yellow underlined Red Text on ugly Canvas
      child: Center(
        child: Text('Login Page', style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textScaler: TextScaler.linear(2.0),
        ),
      ),
    );
  }
}

/*
textScaleFactor
    By default it is 1.0
    Deprecated. Will be removed in a future version of Flutter. Use [textScaler] instead.

-->  */