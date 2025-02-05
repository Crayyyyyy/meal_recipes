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
          color: category.color.withValues(alpha: 0.75),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  offset: Offset(0.6, 0.6),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
                Shadow(
                  offset: Offset(-0.6, 0.6),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
                Shadow(
                  offset: Offset(0.6, -0.6),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
                Shadow(
                  offset: Offset(-0.6, -0.6),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
