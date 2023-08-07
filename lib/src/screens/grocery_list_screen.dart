import 'package:flutter/material.dart';

import '../utils/grocery_manager.dart';
import '../widgets/grocery_tile.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({
    super.key,
    required this.groceryManager,
  });

  final GroceryManager groceryManager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = groceryManager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = groceryItems[index];

          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              groceryManager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} dismissed')),
              );
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    groceryManager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                final json = item.copyWith(index: index).toJson();

                Navigator.restorablePushNamed(
                  context,
                  GroceryItemScreen.routeName,
                  arguments: json,
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}
