import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/data/data_dummy.dart';

final provideMeals = Provider(
  (refProvider) {
    return dummyMeals;
  },
);
