import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/providers/provider_filters.dart';

class PageFilters extends ConsumerWidget {
  const PageFilters({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(provideFilters);

    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          for (var filter in filters.entries)
            SwitchListTile(
              value: filter.value,
              onChanged: (isOn) {
                ref.read(provideFilters.notifier).setFilter(filter.key, isOn);
              },
              title: Text(
                filter.key,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              subtitle: Text('Only include ${filter.key} recipes.'),
            )
        ],
      ),
    );
  }
}
