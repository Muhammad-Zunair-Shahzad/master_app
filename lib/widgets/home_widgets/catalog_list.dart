import 'package:flutter/material.dart';
import 'package:master_app/models/cart.dart';
import 'package:master_app/pages/home_details_page.dart';
import 'package:master_app/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:master_app/models/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          // VIP NOTE1
          final catalog = CatalogModel.items![index]; // NOTE1.1
          return InkWell(
              onTap: () {
                Navigator.of(context).push(// NOTE5
                    MaterialPageRoute(// NOTE6
                        builder: (context) {
                  return HomeDetailsPage(catalog: catalog // NOTE7, NOTE8
                      );
                }));
              },
              child: CatalogItem(catalog: catalog));
        }); // I remove .expand form here
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
        Hero(tag: catalog.id, child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold
                  .color(context.accentColor)
                  .make(), // NOTE3
              catalog.desc.text.textStyle(context.captionStyle).make(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ),
            ],
          ),
        ),
      ],
    )).color(context.cardColor).rounded.square(150).make().py16(); // NOTE1
  }
}

class _AddToCart extends StatefulWidget {
  const _AddToCart({super.key, required this.catalog});
  final Item catalog;
  @override
  State<_AddToCart> createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle(); // NOTE9
        // Add selected items to cart
        final catalog = CatalogModel();
        final cart = CartModel();
        cart.catalog = catalog; // cart file may list jo bnai hai us kay liyay hum nay catalog function use kia hai is liyay zroori hai 
        cart.add(widget.catalog);
        setState(() {
          // NOTE10
        });
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          context.theme.floatingActionButtonTheme.backgroundColor, // NOTE2
        ),
        shape: const WidgetStatePropertyAll(
          StadiumBorder(),
        ),
      ),
      child: isAdded ? const Icon(Icons.done) : "Add To Cart".text.make(),
    );
  }
}





/*
NOTE1:
       --> I'm removing WHITE from here :- .white.rounded.square(150).make().py16();
       --> WHITE is the color inside the VxBox which becomes ugly when the darkTheme enable (Read NOTE5 of themes.dart)

NOTE1.1:
       --> I am removing this: final catalog = CatalogModel.getByPosition(index)
       --> because getByPosition is no more static
       --> basically static means that we are not creating an instance 
       --> What is the condition of instance Ans) we use () with instance name 

NOTE2:
       --> Normally in theme.dart inside the darkTheme i write like  canvasColor: , accentColor: , etc
       --> But in that case
               floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: indigoColor,
              ),
        --> Now see above that there is a property and a widget so when in order to access this you can use context.theme 
            like :- context.theme.floatingActionButtonTheme.backgroundColor

NOTE3:
        --> catalog.name.text.lg.bold.color(MyThemes.darkBluishColor).make()
        --> I add context.accentColor instead of MyThemes.darkBluishColor

NOTE4:
        --> final catalog = CatalogModel.items![index]; or 
            final catalog = CatalogModel.getByPosition(index);

NOTE5:
        --> Navigator.of(<current widget context>).push(................);

NOTE6: 
        --> Class which works like GPS Navigations System, It tells you app where to go?

NOTE7: 
        --> We shoult pass a map or an object to HomeDetailsPage

NOTE8:
        --> catalog: catalog
        --> catalog is basically the Map
        --> so if I want to open the smae image like of ear pods then I can also write as: catalog: CatalogModel.getById(2)
        --> where 2 is the number of item in the home screen (it's not an index)

NOTE9
        --> false = true (after toogle) OR true = false (after toogle)

NOTE10
        --> Must set the state for toggle purpose
 */
