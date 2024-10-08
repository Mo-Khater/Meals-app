import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favmeals_provider.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/wedges/main_drawer.dart';
import 'package:meals/providers/favmeals_provider.dart';

class TabsScreeen extends ConsumerStatefulWidget {
  const TabsScreeen({super.key});

  @override
  ConsumerState<TabsScreeen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabsScreeen> {
  Widget? _activeScreen;
  String _activeScreenTitle = 'Categories';
  int _selectedIndex = 0;

  void _selectTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> selectedMeals = ref.watch(filterMealsProvider);
    _activeScreen = CategoriesScreen(
      meals: selectedMeals,
    );
    _activeScreenTitle = 'Categories';
    if (_selectedIndex == 1) {
      final favMeals = ref.watch(favMealsProvider);
      _activeScreen = MealsScreen(meals: favMeals);
      _activeScreenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_activeScreenTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: _activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _selectTab(value),
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
