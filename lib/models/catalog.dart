// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// When you declare CatalogModel.items as nullable (like List<Item>?), the compiler assumes that items could be null...
// Therefore, when you try to access its properties like (itemCount: CatalogModel.items!.length), the compiler gives an error because it cannot guarantee 
// that items has been initialized with a non-null value...
// When you use CatalogModel.items!.length, you're forcing the compiler to treat items as non-null.
// If items is null at runtime and you use the ! operator, it will result in a runtime error (Null check operator used on a null value).
class CatalogModel {
  static List<Item>? items;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: this.id,
      name: this.name,
      desc: this.desc,
      price: this.price,
      color: this.color,
      image: this.image,
    );
  }

  Map<String, dynamic> toMap() {
    // I remove ??
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    // I remove as
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
