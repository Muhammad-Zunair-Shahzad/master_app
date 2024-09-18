import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Center(
        child: Text('Welcome to $days days of flutter'),
      ),
      drawer: const Drawer(),
    );
  }
}



// r: remove
// i: info 
// c: comment 

// -r Material() \-c // Make all the screen White --> Scaffold()
// -i Scaffold has 3 parts : 1) Header (appBar), Body, and footer



