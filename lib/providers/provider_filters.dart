import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/providers/provider_meals.dart';

class FiltersNotifier extends StateNotifier<Map<String, bool>> {
  FiltersNotifier()
      : super({
          "Gluten-free": false,
          "Lactose-free": false,
          "Vegan": false,
          "Vegetarian": false,
        });

  void setFilter(String filter, bool value) {
    state = {...state, filter: value};
  }
}

final provideFilters =
    StateNotifierProvider<FiltersNotifier, Map<String, bool>>(
  (ref) => FiltersNotifier(),
);

final provideFilteredMeals = Provider((ref) {
  final meals = ref.watch(provideMeals);
  final filters = ref.watch(provideFilters);
  return meals.where((meal) {
    if (filters["Gluten-free"]! && !meal.isGlutenFree) return false;
    if (filters["Lactose-free"]! && !meal.isLactoseFree) return false;
    if (filters["Vegan"]! && !meal.isVegan) return false;
    if (filters["Vegetarian"]! && !meal.isVegetarian) return false;
    return true;
  }).toList();
});
