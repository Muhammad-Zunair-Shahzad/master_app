import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material( 
      child: Column(
        children: [
          Image.asset('assets/images/login_image.png'),
        ],
      )
    );
  }
}

