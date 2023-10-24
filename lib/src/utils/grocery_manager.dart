import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/grocery_item.dart';

/// Manages the changing and updating of grocery items.
class GroceryManager with ChangeNotifier {
  static const itemsKey = 'grocery_items';
  List<GroceryItem> _groceryItems = [];
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  GroceryManager() {
    initGroceryItems();
  }

  /// Sets `_groceryItems` value if there is data from local storage.
  void initGroceryItems() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString(itemsKey);
    final items = <GroceryItem>[];

    if (dataString != null) {
      jsonDecode(dataString).asMap().forEach((i, v) {
        v['index'] = i.toString();
        items.add(GroceryItem.fromJson(v));
      });

      _groceryItems = items;
      notifyListeners();
    }
  }

  /// Adds a new grocery item at the end of the list.
  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    setGroceryItems();
    notifyListeners();
  }

  /// Replaces the old item at a given index with a new item.
  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    setGroceryItems();
    notifyListeners();
  }

  /// Deletes an item at a particular index.
  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    setGroceryItems();
    notifyListeners();
  }

  /// Toggles the `isComplete` flag on and off.
  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    setGroceryItems();
    notifyListeners();
  }

  /// Persists grocery items to local storage.
  void setGroceryItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(itemsKey, jsonEncode(_groceryItems));
  }
}
