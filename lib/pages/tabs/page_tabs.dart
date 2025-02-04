import 'package:flutter/material.dart';
import 'package:meal_recipes/objects/meal.dart';
import 'package:meal_recipes/pages/categories/page_categories.dart';
import 'package:meal_recipes/pages/filters/page_filters.dart';
import 'package:meal_recipes/pages/meals/page_meals.dart';
import 'package:meal_recipes/pages/tabs/components/drawer_main.dart';

const Map<String, bool> kFilters = {
  "Gluten-free": false,
  "Lactose-free": false,
  "Vegetarian": false,
  "Vegan": false,
};

class PageTabs extends StatefulWidget {
  const PageTabs({super.key});

  @override
  State<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends State<PageTabs> {
  int indexPage = 0;
  List<Meal> favoriteMeals = [];
  Map<String, bool> filters = kFilters;

  void _pushSettings(BuildContext context) async {
    Navigator.of(context).pop();
    Map<String, bool> temp = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return PageFilters(pageFilters: filters);
        },
      ),
    );
    setState(() {
      filters = temp;
    });
  }

  void toggleFavoriteMeal(Meal meal) {
    bool isInList = favoriteMeals.contains(meal);
    if (isInList) {
      setState(() {
        favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      indexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        PageCategories(onToggleFavorite: toggleFavoriteMeal, filters: filters);
    if (indexPage == 1) {
      activePage = PageMeals.fromList(
          meals: favoriteMeals, onToggleFavorite: toggleFavoriteMeal);
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
