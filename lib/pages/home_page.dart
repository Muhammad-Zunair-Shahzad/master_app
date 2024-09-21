import 'package:flutter/material.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/drawer.dart';
import 'package:master_app/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length, 
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index], 
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
