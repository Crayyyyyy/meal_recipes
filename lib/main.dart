import 'package:flutter/material.dart';
import 'package:meal_recipes/pages/categories/page_categories.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF00ff00));

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes app',
      home: PageCategories(),
      theme: ThemeData().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: AppBarTheme()
            .copyWith(backgroundColor: kColorScheme.onSurfaceVariant),
        scaffoldBackgroundColor: kColorScheme.onSurface,
        colorScheme: kColorScheme,
      ),
    );
  }
}
