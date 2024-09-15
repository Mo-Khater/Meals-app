import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> selectedFilters;

  const FilterScreen({super.key, required this.selectedFilters});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool switchState = false;
  bool lactoseState = false;
  bool vegeterianState = false;
  bool veganState = false;

  @override
  void initState() {
    super.initState();
    switchState = widget.selectedFilters[Filter.glutenFree]!;
    lactoseState = widget.selectedFilters[Filter.lactoseFree]!;
    vegeterianState = widget.selectedFilters[Filter.vegetarian]!;
    veganState = widget.selectedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: switchState,
            Filter.lactoseFree: lactoseState,
            Filter.vegetarian: vegeterianState,
            Filter.vegan: veganState,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              value: switchState,
              onChanged: (state) {
                setState(() {
                  switchState = state;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include Lactose-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              value: lactoseState,
              onChanged: (state) {
                setState(() {
                  lactoseState = state;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'vegan-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include vegan-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              value: veganState,
              onChanged: (state) {
                setState(() {
                  veganState = state;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegeterian-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include Vegeterian-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              value: vegeterianState,
              onChanged: (state) {
                setState(() {
                  vegeterianState = state;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
