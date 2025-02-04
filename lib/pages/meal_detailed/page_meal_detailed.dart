import 'package:flutter/material.dart';
import 'package:meal_recipes/components/meal_item_detail.dart';
import 'package:meal_recipes/objects/meal.dart';

class PageMealDetailed extends StatefulWidget {
  PageMealDetailed(
      {super.key, required this.meal, required this.onToggleFavorite});

  Meal meal;
  void Function(Meal meal) onToggleFavorite;
  @override
  State<PageMealDetailed> createState() => _PageMealDetailedState();
}

class _PageMealDetailedState extends State<PageMealDetailed> {
  String get complexityString {
    return widget.meal.complexity.name[0].toUpperCase() +
        widget.meal.complexity.name.substring(1);
  }

  String get affordabilityString {
    return widget.meal.affordability.name[0].toUpperCase() +
        widget.meal.affordability.name.substring(1);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                width: 2,
                color: Colors.black.withAlpha(51),
              )),
          padding: EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.meal.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white.withAlpha(127),
                      ),
                      onPressed: () {
                        widget.onToggleFavorite(widget.meal);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealItemInfo(
                      title: '${widget.meal.duration} min',
                      icon: Icons.schedule,
                    ),
                    SizedBox(width: 32),
                    MealItemInfo(
                      title: complexityString,
                      icon: Icons.work,
                    ),
                    SizedBox(width: 32),
                    MealItemInfo(
                      title: affordabilityString,
                      icon: Icons.attach_money,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text("Ingredients",
                    style: Theme.of(context).textTheme.titleMedium),
                for (String ingredient in widget.meal.ingredients)
                  Row(
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.white.withAlpha(25),
                      ),
                      Text(ingredient),
                    ],
                  ),
                SizedBox(height: 16),
                Text("Steps", style: Theme.of(context).textTheme.titleMedium),
                for (int i = 0; i < widget.meal.steps.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Text('${i + 1}. ${widget.meal.steps[i]}'),
                  )
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // Adjust the height as needed
        child: AppBar(
          elevation: 2,
          flexibleSpace: Image.network(
            widget.meal.imageUrl,
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
