import 'package:flutter/material.dart';
import 'package:meal_recipes/pages/filters/page_filters.dart';

class DrawerMain extends StatelessWidget {
  DrawerMain({super.key, required this.parentRouteFunction});

  void Function(BuildContext context) parentRouteFunction;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).appBarTheme.backgroundColor!,
                  Theme.of(context)
                      .appBarTheme
                      .backgroundColor!
                      .withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: 18),
                Text(
                  "Dishcovery",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white.withValues(alpha: 0.65),
            ),
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              parentRouteFunction(context);
            },
          ),
        ],
      ),
    );
  }
}
