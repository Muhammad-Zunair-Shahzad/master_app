import 'package:flutter/material.dart';
import 'package:master_app/widgets/drawer.dart';

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
      drawer: const MyDrawer(),
    );
  }
}
