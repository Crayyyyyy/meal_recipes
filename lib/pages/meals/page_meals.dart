import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/objects/category.dart';
import 'package:meal_recipes/objects/meal.dart';
import 'package:meal_recipes/data/data_dummy.dart';
import 'package:meal_recipes/pages/meal_detailed/page_meal_detailed.dart';
import 'package:meal_recipes/pages/meals/components/card_meal.dart';

class PageMeals extends StatelessWidget {
  PageMeals({super.key, required this.category})
      : meals = dummyMeals
            .where((meal) => meal.categories.contains(category!.id))
            .toList();

  PageMeals.fromList({super.key, required this.meals});

  PageMeals.withFilters(
      {super.key, required this.category, required this.filters})
      : meals = dummyMeals
            .where((meal) => meal.categories.contains(category!.id))
            .where((meal) {
          if (filters!["Gluten-free"]! && !meal.isGlutenFree) return false;
          if (filters!["Lactose-free"]! && !meal.isLactoseFree) return false;
          if (filters!["Vegan"]! && !meal.isVegan) return false;
          if (filters!["Vegetarian"]! && !meal.isVegetarian) return false;
          return true;
        }).toList();

  Map<String, bool>? filters;
  Category? category;
  List<Meal> meals;

  void _routeMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PageMealDetailed(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category == null ? "Favorites" : category!.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final m = meals[index];
          return CardMeal(
            meal: m,
            parentRouteFunction: () {
              _routeMeal(context, meals[index]);
            },
          );
        },
      ),
    );
  }
}
