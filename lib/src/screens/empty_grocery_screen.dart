import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../utils/tab_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/empty_list.png'),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.noGroceries,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              '${AppLocalizations.of(context)!.shoppingForIngredients}\n'
              '${AppLocalizations.of(context)!.tapButton}',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
              textColor: Colors.white,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(AppLocalizations.of(context)!.browseRecipes),
            ),
          ],
        ),
      ),
    );
  }
}
