import 'package:flutter/material.dart';

/// Manages the tab index that the user taps.
class TabManager with ChangeNotifier {
  /// Keeps track of which tab the user tapped.
  int selectedTab = 0;

  /// Simple function that modifies the current tab index.
  void goToTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  /// Specific function that sets `selectedTab` to the Recipes tab,
  /// which is at index 1.
  void goToRecipes() {
    selectedTab = 1;
    notifyListeners();
  }
}
