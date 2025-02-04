import 'package:flutter/material.dart';
import 'package:meal_recipes/components/meal_item_detail.dart';
import 'package:meal_recipes/objects/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class CardMeal extends StatelessWidget {
  CardMeal({super.key, required this.meal, required this.parentRouteFunction});

  Meal meal;
  void Function() parentRouteFunction;

  String get complexityString {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityString {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: parentRouteFunction,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black45.withValues(alpha: 0.65),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemInfo(
                          title: '${meal.duration} min',
                          icon: Icons.schedule,
                        ),
                        SizedBox(width: 12),
                        MealItemInfo(
                          title: complexityString,
                          icon: Icons.work,
                        ),
                        SizedBox(width: 12),
                        MealItemInfo(
                          title: affordabilityString,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
