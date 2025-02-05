import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/pages/categories/page_categories.dart';
import 'package:meal_recipes/pages/filters/page_filters.dart';
import 'package:meal_recipes/pages/meals/page_meals.dart';
import 'package:meal_recipes/pages/tabs/components/drawer_main.dart';
import 'package:meal_recipes/providers/provider_favorites.dart';

class PageTabs extends ConsumerStatefulWidget {
  const PageTabs({super.key});

  @override
  ConsumerState<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends ConsumerState<PageTabs> {
  int indexPage = 0;

  void _pushSettings(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return PageFilters();
        },
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = PageCategories();

    if (indexPage == 1) {
      final mealsFavorite = ref.watch(provideFavoriteMeals);
      activePage = PageMeals.fromList(meals: mealsFavorite);
    }

    return Scaffold(
      drawer: DrawerMain(
        parentRouteFunction: _pushSettings,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        enableFeedback: true,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      body: activePage,
    );
  }
}
