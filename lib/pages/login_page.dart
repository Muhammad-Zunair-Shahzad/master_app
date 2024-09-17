import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material( 
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

