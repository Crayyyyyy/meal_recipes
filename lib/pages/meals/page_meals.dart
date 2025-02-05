import 'package:flutter/material.dart';
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
  final List<Meal> meals;

  void _routeMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PageMealDetailed(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
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
    );
    if (meals.length == 0) {
      content = EmptySearch();
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(
            shadows: [],
          ),
          title: Text(category == null ? "Favorites" : category!.title),
        ),
        body: content);
  }
}

class EmptySearch extends StatelessWidget {
  EmptySearch({super.key});
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_neutral_sharp,
            size: 72,
            color: Colors.white.withValues(alpha: 0.25),
          ),
          Text(
            "No meals were found here",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
              "Maybe there are no meals for this criteria\nor you need to add something.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withValues(alpha: 0.25),
                  )),
        ],
      ),
    );
  }
}
