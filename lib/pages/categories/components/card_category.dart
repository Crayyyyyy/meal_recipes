import 'package:flutter/material.dart';
import 'package:meal_recipes/objects/category.dart';

class CardCategory extends StatelessWidget {
  CardCategory(
      {super.key, required this.category, required this.parentRouteFunction});

  Category category;
  void Function() parentRouteFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: parentRouteFunction,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withValues(alpha: 0.9),
            category.color.withValues(alpha: 0.55),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
