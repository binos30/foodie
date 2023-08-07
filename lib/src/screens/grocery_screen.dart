import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/grocery_manager.dart';
import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to the grocery item page. If the user leaves and returns
          // to the app after it has been killed while running in the
          // background, the navigation stack is restored.
          Navigator.restorablePushNamed(
            context,
            GroceryItemScreen.routeName,
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, groceryManager, child) {
        if (groceryManager.groceryItems.isNotEmpty) {
          return GroceryListScreen(groceryManager: groceryManager);
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
