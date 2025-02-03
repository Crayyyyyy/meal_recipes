import 'package:flutter/material.dart';
import 'package:meal_recipes/objects/category.dart';
import 'package:meal_recipes/objects/meal.dart';
import 'package:meal_recipes/data/data_dummy.dart';
import 'package:meal_recipes/pages/meals/components/card_meal.dart';

class PageMeals extends StatelessWidget {
  PageMeals({super.key, required this.category})
      : meals = dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

  Category category;
  List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return CardMeal(meal: meals[index]);
        },
      ),
    );
  }
}
