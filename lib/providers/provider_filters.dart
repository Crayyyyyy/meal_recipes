import 'package:flutter_riverpod/flutter_riverpod.dart';

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
