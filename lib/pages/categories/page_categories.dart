import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/data/data_dummy.dart';
import 'package:meal_recipes/objects/category.dart';
import 'package:meal_recipes/pages/categories/components/card_category.dart';
import 'package:meal_recipes/pages/meals/page_meals.dart';
import 'package:meal_recipes/providers/provider_filters.dart';

class PageCategories extends ConsumerWidget {
  const PageCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(provideFilters);

    void routeCategory(BuildContext context, Category category) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PageMeals.withFilters(
            category: category,
            filters: filters,
          ),
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/image-cover.png",
            fit: BoxFit.cover,
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height / 2 - 100,
              elevation: 5,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Dishcovery",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final cat = dummyCategories[index];
                    return CardCategory(
                      category: cat,
                      parentRouteFunction: () {
                        routeCategory(context, cat);
                      },
                    );
                  },
                  childCount: dummyCategories.length,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
