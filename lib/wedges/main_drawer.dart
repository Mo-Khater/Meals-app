import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatelessWidget {

  final void Function(String identifier) onSelectScreen;

  const MainDrawer({super.key,required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.onPrimary,
                Theme.of(context).colorScheme.onPrimary.withOpacity(.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Cooking up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }
}
