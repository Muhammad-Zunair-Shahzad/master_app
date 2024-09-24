import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/drawer.dart';
import 'package:master_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
// GRID TILE Header
                      header: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all()
                        ),
                        padding: const EdgeInsets.all(12),
                        width: 100.0, // Specifying width: 100.0, will be ignored since GridTile forces the container to adapt to its own constraints.
                        child: Text(
                          item.name, 
                          style: const TextStyle(
                            color: Colors.white),
                        ),
                      ),
// GRID TILE Footer
                      footer: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all()
                        ),
                        padding: const EdgeInsets.all(12),
                        width: 100.0, // Specifying width: 100.0, will be ignored since GridTile forces the container to adapt to its own constraints.
                        child: Text(
                          item.price.toString(), 
                          style: const TextStyle(
                            color: Colors.white),
                        ),
                      ),
// GRID TILE Child
                      child: Image.network(item.image),
                    ));
                },
                itemCount: CatalogModel.items!.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

// ListView.builder(
//           itemCount: CatalogModel.items!.length, 
//           itemBuilder: (context, index) {
//             return ItemWidget(
//               item: CatalogModel.items![index],
//             );
//           },
//         )