import 'package:flutter/material.dart';
import 'package:exercicio6/models/item.dart';

class FavoriteItems extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void editItem(Item oldItem, Item newItem) {
    final index = _items.indexOf(oldItem);
    if (index != -1) {
      _items[index] = newItem;
      notifyListeners();
    }
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
