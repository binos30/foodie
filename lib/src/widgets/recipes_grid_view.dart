import 'package:flutter/material.dart';

import '../models/simple_recipe.dart';
import 'recipe_thumbnail.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({
    super.key,
    required this.recipes,
  });

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeThumbnail(recipe: recipe);
        },
        itemCount: recipes.length,
      ),
    );
  }
}
