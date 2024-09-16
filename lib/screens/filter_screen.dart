import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
class FilterScreen extends ConsumerWidget {

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    Map<Filter,bool>activeFilters=ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: Column(
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
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (state) {
                ref.read(filterProvider.notifier).changeFilter(Filter.glutenFree, state);
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
              value:  activeFilters[Filter.lactoseFree]!,
              onChanged: (state) {
                ref.read(filterProvider.notifier).changeFilter(Filter.lactoseFree, state);
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
              value:  activeFilters[Filter.vegan]!,
              onChanged: (state) {
                ref.read(filterProvider.notifier).changeFilter(Filter.vegan, state);
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
              value:  activeFilters[Filter.vegetarian]!,
              onChanged: (state) {
                ref.read(filterProvider.notifier).changeFilter(Filter.vegetarian, state);
              },
            ),
          ],
        ),
      );
  }
}
