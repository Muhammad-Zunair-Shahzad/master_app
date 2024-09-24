import 'dart:convert'; // Gives Json ecorder or Json decorder
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
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];

    // As List<Item>list is same as CatalogModel.items so
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    debugPrint(CatalogModel.items.toString());

    // List<Item> list = List.from(productData)
    // .map<Item>((item) => Item.fromMap(item))
    // .toList();

    // Above is same as
    // static final List<Item> items = [ // This is a list we made above
    //   Item(
    //       id: 1,
    //       name: "iPhone 12 Pro",
    //       desc: "Apple iPhone 12th generation",
    //       price: 999,
    //       color: "#33505a",
    //       image:
    //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
    //];
  }

// This is given by chatgpt 
//   loadData() async {
//   final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
//   var decodedData = jsonDecode(catalogJson);
//   var productsData = decodedData['products'];
//   for (var product in productsData) {
//     print("Product name: ${product['name']}");
//   }
// }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
