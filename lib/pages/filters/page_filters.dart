import 'package:flutter/material.dart';

class PageFilters extends StatefulWidget {
  PageFilters({super.key, required this.pageFilters});
  Map<String, bool> pageFilters;

  @override
  State<PageFilters> createState() => _PageFiltersState();
}

class _PageFiltersState extends State<PageFilters> {
  Map<String, bool> filters = {
    "Gluten-free": false,
    "Lactose-free": false,
    "Vegetarian": false,
    "Vegan": false,
  };

  @override
  void initState() {
    filters["Gluten-free"] = widget.pageFilters["Gluten-free"]!;
    filters["Lactose-free"] = widget.pageFilters["Lactose-free"]!;
    filters["Vegetarian"] = widget.pageFilters["Vegetarian"]!;
    filters["Vegan"] = widget.pageFilters["Vegan"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop(filters);
        },
        child: Column(
          children: [
            for (var filter in filters.entries)
              SwitchListTile(
                value: filter.value,
                onChanged: (isOn) {
                  setState(() {
                    filters[filter.key] = isOn;
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
      ),
    );
  }
}
