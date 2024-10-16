import 'dart:convert';

class CatalogModel {

  // Instead of creating a new CatalogModel object we will use an existing object --> this is singleton object (same concept gies for CartModel class of cart.dart)
  static final catModel = CatalogModel.internal();
  CatalogModel.internal();
  factory CatalogModel() => catModel;

  // NOTE0
  static List<Item>? items;

  // NOTE1: Get an item by Id
  Item getById(int id) {
    return items!.firstWhere((item) => item.id == id);  
  }

  // NOTE2: Get an item by pos
  Item getByPosition(int pos) {
    return items![pos];
  }
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

/*

NOTE0:
      --> List<Item>: This defines a list that holds items of type Item.
      --> ? (nullable): The question mark (?) means that the items list can be either:
      --> A list of Item objects (e.g., [Item(id: 1, ...), Item(id: 2, ...)]), or
      --> It can be null, meaning the list has not been initialized or assigned any value.
      --> Without the ?, the list is non-nullable and must always have a value (even if it’s just an empty list, like []).

NOTE1:
      --> items!:- items is not null at that time.
      --> firstWhere searches through the list of items and returns the first element that satisfies the condition.
      --> firstWhere means like: jasy hi element milay us ko first time may hi return kr do zyada dair na lgao
      --> (element) => element.id == id MEANS THAT "find the element where element.id equals id"
      --> If such an element is found, firstWhere will return that element.

NOTE2:
      --> Type of Item : List<Item>?
      --> the list contains Map 
      --> Map has indexes [0] --> [7]
      --> these Maps are actually the products and items details in the home screen 


*/