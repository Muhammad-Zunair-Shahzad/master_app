import 'package:master_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel.internal();
  CartModel.internal();
  factory CartModel() => cartModel;

  // NOTE0
  CatalogModel? _catalog;

  // Get Catalog
  CatalogModel get catalog {
    return _catalog!;
  }

  // Set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Collectionof ID's - store Ids of each Item
  final List<int> _itemIds = [];

  // Get items in the cart
  List<Item> get items {
    return _itemIds.map<Item>((id) => _catalog!.getById(id)).toList();
  }

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item to the List of int ids
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item to the List of int ids
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
