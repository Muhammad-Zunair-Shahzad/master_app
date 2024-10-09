import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_app/utils/routes.dart';
import 'package:master_app/widgets/home_widgets/catalog_header.dart';
import 'package:master_app/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:master_app/models/catalog.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NOTE1
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
      // NOTE2
        child:const Icon(CupertinoIcons.cart, color: Colors.white,),
      ),
      body: SafeArea( 
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              const CatalogList().py16().expand() 
              else
              const Center(child: CircularProgressIndicator()).expand(),
            ],
          ),
        ),
      ),
    );
  }
}

/*
NOTE1:-
      Previously:-
      backgroundColor: MyThemes.creamColor,

      Scaffold color change according to the vivo theme that either it is dark or light at that time      
      backgroundColor: context.cardColor, 
      
      context.canvasColor --> using velocity x package
      Either you mention the background color or not, By default Scaffold follows canvas color
      Default canvas color is white but I explicitely add canvasColor: darkCreamColor in MyThemes file

NOTE2:-
      False: backgroundColor: context.theme.buttonColor,
      True: I already add FloatingActionButtonTheme in the themes.dartf file 
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