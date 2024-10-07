import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:master_app/models/catalog.dart';
import 'package:master_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Covers the whole screen just like material widget
      backgroundColor: MyThemes.creamColor, // Overall background color changes to cream instead of white
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ), // By default provides back (< icon)
      bottomNavigationBar: Container( // I am adding this container to to fix the bottom color with the container color
        color: Colors.white, // bottom color is cream and arc contaienr color is white so i also  change bottom color to white using a container
        child: OverflowBar( // A bottom navigation bar to display at the bottom of the scaffold
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(
                      MyThemes.darkBluishColor
                    ),
                shape: const WidgetStatePropertyAll(
                  StadiumBorder(),
                ),
              ),
              child: "Add To Cart".text.make(),
            ).wh(120, 50),
          ],
        ).p32(), // The elevated button goes too much down so I add a padding of 32 from all directions
      ), // Add padding to Botton Navigation Bar
      body: SafeArea(
        // Good Practice
        bottom: false, // Remove SafeArea from bottom
        child: Column(
          children: [
            Hero(tag: catalog.id, child: Image.network(catalog.image)).h32(context), // In the closing bracket of Hero, I add padding of .p16() but we can also add height .h32(context) of the image instead of internal padding
            Expanded(
              child: VxArc(
                height: 30.0, // Defines the height of that curve
                arcType: VxArcType.convey, // By default convex
                edge: VxEdge.top, // You want curve at which edge
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth, // When I add column inside the container the width of container narrows so use this to avoid narrow
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(MyThemes.darkBluishColor)
                          .make(),
                      catalog.desc.text.lg
                          .textStyle(context.captionStyle)
                          .make(),
                      const HeightBox(10),
                      lorem(paragraphs: 1, words: 50).text
                          .textStyle(context.captionStyle)
                          .make()
                    ],
                  ).pLTRB(16, 64, 16, 64), // Due to arc name and description cut from the top so add padding inside the column
                ),
              ),
            ),
          ],
        ), // I removes .p16() from here and add to closing bracket of hero, because i dont want padding for container
      ),
    );
  }
}
