import 'package:flutter/material.dart';
import 'package:master_app/pages/home_details_page.dart';
import 'package:master_app/widgets/home_widgets/catalog_image.dart';
import 'package:master_app/widgets/themes.dart';
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
          final catalog = CatalogModel.items![index];
          return InkWell(
              onTap: () {
                Navigator.of(context).push( // Navigator.of(<current widget context>).push(................);
                  MaterialPageRoute( // Class which works like GPS Navigations System, It tells you app where to go?
                    builder: (context){
                      return HomeDetailsPage( 
                        catalog: catalog // We shoult pass a map or an object to HomeDetailsPage
                      );
                    }
                  )
                );
              },
              child: CatalogItem(catalog: catalog)
          );
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
        Hero(
          tag: catalog.id,
          child: CatalogImage(image: catalog.image) // We want to wrap image with Hero because we animate the image 
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.color(MyThemes.darkBluishColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(MyThemes.darkBluishColor),
                        shape: const WidgetStatePropertyAll(
                          StadiumBorder(),
                        ),
                      ),
                      child: "Add To Cart".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              )
            ],
          ),
        ),
      ],
    )).white.rounded.square(150).make().py16();
  }
}
