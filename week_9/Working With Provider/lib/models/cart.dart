import 'package:flutter/material.dart';
import 'package:working_with_provider/models/catalog.dart';

class CartModel extends ChangeNotifier{

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog( CatalogModel newCatalog){
    _catalog = newCatalog;
    notifyListeners();
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
  }

  //List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Total price of the items
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item to the cart. It is the only method to add item from the outside.
  void add(Item item){
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item){
    _itemIds.remove(item.id);
    notifyListeners();
  }
}