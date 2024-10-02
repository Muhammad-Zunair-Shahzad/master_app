import 'package:flutter/material.dart';
import 'package:master_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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