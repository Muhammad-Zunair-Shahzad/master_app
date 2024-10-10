import 'package:master_app/models/catalog.dart';

class Cart {
  // NOTE0
  CatalogModel? _catalog;

  // Collectionof ID's - store Ids of each Item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog {
    return _catalog!; 
  } 

  // Set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items {
    return _itemIds.map((id) => _catalog!.getById(id)).toList();
  } 

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

/*
NOTE0:
      --> Dart is nulla language HaHa.
      --> Dart doesn't that _catalog is null so we explicitely tell DART.
      --> Hey! DART catalog must contain something or null.
 */