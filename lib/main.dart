import 'package:flutter/material.dart';
import 'package:meal_recipes/pages/categories/page_categories.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes app',
      // home: PageMeals(category: dummyCategories[1]),
      home: PageCategories(),
    );
  }
}
