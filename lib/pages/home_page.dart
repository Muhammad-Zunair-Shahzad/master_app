import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/themes.dart';
//import 'package:master_app/widgets/drawer.dart';
//import 'package:master_app/widgets/item_widget.dart';

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
      body: SafeArea( 
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(), 
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
    return Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
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
    ).expand(); // expand or 
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
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.color(MyThemes.darkBluishColor).make(), // lg , xl -> size
                catalog.desc.text.textStyle(context.captionStyle).make(),
                Padding(
                  padding: const EdgeInsets.only(top: 10), // you can also use sizedbox 
                  child: OverflowBar(
                    // spacing: 82, // Not recommend use .pOnly(right: 8.0)
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            MyThemes.darkBluishColor
                          ),
                          shape: const WidgetStatePropertyAll(
                            StadiumBorder(),
                          ),
                        ),
                        child:"Buy".text.make(), 
                      ),
                    ],
                  ).pOnly(right: 8.0),
                )
              ],
            ),
          ),
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
          image,
          fit: BoxFit.contain,
          ).box.rounded.p8.color(MyThemes.creamColor).make().p16().w40(context);
  }
}







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