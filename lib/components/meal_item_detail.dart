import 'package:flutter/material.dart';

class MealItemInfo extends StatelessWidget {
  const MealItemInfo({super.key, required this.title, required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.6),
          size: 20,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
