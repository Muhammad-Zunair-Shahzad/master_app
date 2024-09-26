import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/drawer.dart';
import 'package:master_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:master_app/widgets/item_widget.dart';

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
      backgroundColor: MyThemes.creamColor,
      body: SafeArea( // whatever we write is between the bodder and header of the screen 
        child: Container(
          padding: Vx.m32, // This is edge insets.all
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(), // wither use expand() here or at the end of the ListView.builder().expand
              if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              const CatalogList()
              else
              const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      )
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // This is like Catalog Header so make a class and add this column to that class
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(), // This is same as Text("Catalog App")
              "Trending Products".text.xl2.make(),
            ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder:(context, index){
        final catalog = CatalogModel.items![index];
        return CatalogItem(catalog : catalog);
      }
    ).expand();
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(catalog.image,
          fit: BoxFit.cover,
          ).p8(),
        ],
      )
    ).red400.square(100).make();
  }
}

/*

--> When you write these things

              "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
              "Trending Products".text.make(),

              Trending Products is at the center of the catalog App title, so add crossAxisAlignment start in the column


 */









/*

--> Remove Scaffold app bar 
--> Remove body
--> Remove Drawer

appBar: AppBar(
        title: const Text('Catalog App'),
      ),

body :  Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16
                ),
                itemCount: CatalogModel.items!.length,
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
                
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
 */