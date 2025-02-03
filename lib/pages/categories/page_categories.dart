import 'package:flutter/material.dart';
import 'package:meal_recipes/data/data_dummy.dart';
import 'package:meal_recipes/objects/category.dart';
import 'package:meal_recipes/pages/categories/components/card_category.dart';
import 'package:meal_recipes/pages/meals/page_meals.dart';

class PageCategories extends StatelessWidget {
  const PageCategories({super.key});

  void _routeCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PageMeals(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal categories")),
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (Category cat in dummyCategories)
            CardCategory(
              category: cat,
              parentRouteFunction: () {
                _routeCategory(context, cat);
              },
            )
        ],
      ),
    );
  }
}
