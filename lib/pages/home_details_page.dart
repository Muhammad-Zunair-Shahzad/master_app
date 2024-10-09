import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:master_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NOTE0
      backgroundColor: context.canvasColor, // NOTE1
      appBar: AppBar(
        backgroundColor: Colors.transparent, // NOTE2
      ),
      bottomNavigationBar: Container(
        // NOTE3
        color: context.cardColor, // NOTE4 , NOTE16
        child: OverflowBar(
          // NOTE5
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(context.theme
                        .floatingActionButtonTheme.backgroundColor // NOT19
                    ),
                shape: const WidgetStatePropertyAll(
                  StadiumBorder(),
                ),
              ),
              child: "Add To Cart".text.make(),
            ).wh(120, 50),
          ],
        ).p32(), // NOTE6
      ), // NOTE7
      body: SafeArea(
        bottom: false, // NOTE8
        child: Column(
          children: [
            Hero(tag: catalog.id, child: Image.network(catalog.image))
                .h32(context), // NOTE9
            Expanded(
              child: VxArc(
                height: 30.0, // NOTE10
                arcType: VxArcType.convey, // NOTE11
                edge: VxEdge.top, // NOTE12
                child: Container(
                  color: context.cardColor, // NOTE17
                  width: context.screenWidth, // NOTE13
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(context.accentColor) // NOTE18
                          .make(),
                      catalog.desc.text.lg
                          .textStyle(context.captionStyle)
                          .make(),
                      const HeightBox(14),
                      lorem(paragraphs: 1, words: 50)
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                    ],
                  ).pLTRB(20, 64, 20, 64), // NOTE14
                ),
              ),
            ),
          ],
        ), // NOTE15
      ),
    );
  }
}

/*

NOTE0:
       --> Covers the whole screen just like material widget

NOTE1:
       --> MyThemes.creamColor
       --> instead I preffer context.canvasColor

NOTE2:
       --> By default provides back (< icon)

NOTE3:
       --> I am adding this container to fix the bottom color with the container color

NOTE4:
       --> Bottom color is cream and arc contaienr color is white so i also  change bottom color to white using a container
       
NOTE5:
       --> A bottom navigation bar to display at the bottom of the scaffold

NOTE6:
       --> The elevated button goes too much down so I add a padding of 32 from all directions

NOTE7: 
       --> Previously before NOTE 6 I add padding to Botton Navigation Bar from the bottom of the scaffold

NOTE8:
      --> currenlty of no use but removing SafeArea from bottom so we can utilize the bottom

NOTE9:
      --> In the closing bracket of Hero, I add padding of .p16() but we can also add height .h32(context) of the image instead of internal padding

NOTE10:
      --> Defines the height of that curve

NOTE11:
      --> By default convex
      
NOTE12:
      --> You want curve at which edge

NOTE13:
      --> When I add column inside the container the width of container narrows so use this to avoid narrow

NOTE14:
      --> Due to arc name and description cut from the top so add padding inside the column

NOTE15:
      --> I removes .p16() from here and add to closing bracket of hero, because i dont want padding for container

NOTE16:
      --> color: Colors.white changes to context.cardColor

NOTE17:
      --> color: Colors.white changes to context.cardColor

NOTE18:
      --> .color(MyThemes.darkBluishColor) changes to context.accentColor

NOTE19:
      --> MyThemes.darkBluishColor

 */