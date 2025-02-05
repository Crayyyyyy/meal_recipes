import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes/providers/provider_filters.dart';

class PageFilters extends ConsumerStatefulWidget {
  const PageFilters({super.key});

  @override
  ConsumerState<PageFilters> createState() => _PageFiltersState();
}

class _PageFiltersState extends ConsumerState<PageFilters> {
  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  ref.read(provideFilters.notifier).setFilter(filter.key, isOn);
                });
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
