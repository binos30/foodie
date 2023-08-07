import 'package:flutter/material.dart';

import '../api/mock_foodie_service.dart';
import '../models/simple_recipe.dart';
import '../widgets/recipes_grid_view.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});

  final mockService = MockFoodieService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
