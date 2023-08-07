import 'package:flutter/material.dart';

import '../models/grocery_item.dart';

/// Manages the changing and updating of grocery items.
class GroceryManager with ChangeNotifier {
  final _groceryItems = <GroceryItem>[];

  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  /// Adds a new grocery item at the end of the list.
  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  /// Replaces the old item at a given index with a new item.
  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }

  /// Deletes an item at a particular index.
  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  /// Toggles the `isComplete` flag on and off.
  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
