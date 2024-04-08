import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'screens/explore_screen.dart';
import 'screens/grocery_screen.dart';
import 'screens/recipes_screen.dart';
import 'settings/settings_view.dart';
import 'utils/set_page_title.dart';
import 'utils/tab_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  static List<Widget> pages = <Widget>[
    const ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Foodie',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Navigate to the settings page. If the user leaves and
                  // returns to the app after it has been killed while running
                  // in the background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    SettingsView.routeName,
                  );
                },
              ),
            ],
          ),
          body: IndexedStack(index: tabManager.selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);

              if (index == 1) {
                setPageTitle(AppLocalizations.of(context)!.recipes, context);
              } else if (index == 2) {
                setPageTitle(AppLocalizations.of(context)!.toBuy, context);
              } else {
                setPageTitle('', context);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.explore),
                label: AppLocalizations.of(context)!.explore,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                label: AppLocalizations.of(context)!.recipes,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: AppLocalizations.of(context)!.toBuy,
              ),
            ],
          ),
        );
      },
    );
  }
}
