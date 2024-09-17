import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30; // also use num for (int + double) values
    return Scaffold( // Make all the screen White
    appBar: AppBar(
      title: const Text('Catalog App'),
    ),
      body: Center( // Center the text inside the Container Widget
        child: Container( // In prev versions it is by-default, but here it is still useless 
          child: Text('Welcome to $days days of flutter'), 
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

/*

-r Material() \-c // Make all the screen White --> instead of this use Scaffold() widget, in which we further add some other widgets
-i Scaffold has 3 parts : 1) Header (appBar), Body, and fotter

r: remove
i: info 
c: comment 
*/
