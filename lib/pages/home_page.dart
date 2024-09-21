import 'package:flutter/material.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/drawer.dart';
import 'package:master_app/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // currently we have only 1 item, what if we make multiple copies of that item...
    // Create 50 copies, of an item place at 0 index (0 index because we already know that we habe 1 item till now)...
    // (index) ranges from 0 to 49 for new dummyList...
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length, // we can access .items due to --> final static items []; | Changing CatalogModel.items.length to dummyList.length
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index], // Changing CatalogModel.items[index] to dummyList[index]
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
