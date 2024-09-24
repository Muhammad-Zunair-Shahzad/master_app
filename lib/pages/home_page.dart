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
// CatalogJason stores the JSON file into string
// DecodeData stores the Decoded String
// ProductData stores the value of products key, and that value is a List of Maps starting from [0] index to [7] index
// Now we cannot use List of Maps so covert it into a simple List
// - List.from(productData) -> Which list of Map you want to convert ? A) productData
// - map<Item>((item)) -> join the (individual map or objects or instances) 1 by 1 with the named constructor (fromMap(item)) of Item class
// - Firstly [0] index Map or obj or instance goes to named constructor
// - Secondly [1] index and so on upto Map at [7] index ...
// - At the end we created a List out of List of Map and also assign each Map to Item class
// - Note that what is the type of that List ? A) List<Item> . Which is same as Type of CatalogModel.items so replace 'List<Item> list' with 'CatalogModel.items'
// After the evaluation of R.H.S, we simply get a List of Instances of Item Class instead of List of Maps which is like
// - [Instance of 'Item', Instance of 'Item', Instance of 'Item', Instance of 'Item', Instance of 'Item', Instance of 'Item', Instance of 'Item', Instance of 'Item']
  loadData() async {
    await Future.delayed(const Duration(seconds: 5)); // Wait for 5 sec in order to see this error: "Null check operator used on a null value..."
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items =List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
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
        child:(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items!.length, 
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items![index],
            );
          },
        ): const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

/*
 - Although we force that length cannot be null, but loadData takes some time to convert Json to string, 
   and then decode etc, during this time dart compiler consider the length will be null, and gives an error 
   later on when compiler comes to this line where we forcefuly say that length is not null, then after 
   sometime images and all other data display on the screen

 - CatalogModel.items != null means the variable itself must have been assigned a valid list reference

 - CatalogModel.items!.isNotEmpty  (This si enough instead of writing the CatalogModel.items != null but comprisable)
      * It asserts that items is not null
      * It checks that items is not empty

 - The ! operator asserts that CatalogModel.items is not null. 
   If items is null, it will throw a runtime error. So, using ! 
   guarantees that you believe items is initialized (not null).

*/
