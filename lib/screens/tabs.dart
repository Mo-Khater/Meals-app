import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favmeals_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/wedges/main_drawer.dart';

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
  Map<Filter, bool> selectedFiters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _selectTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    selectedFilters: selectedFiters,
                  )));
      setState(() {
        selectedFiters = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals=ref.watch(mealsProvider);
    List<Meal> selectedMeals = meals.where((meal) {
      if (selectedFiters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFiters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFiters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFiters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    _activeScreen = CategoriesScreen(
      meals: selectedMeals,
    );
    _activeScreenTitle = 'Categories';
    if (_selectedIndex == 1) {
      final favMeals=ref.watch(favMealsProvider);
      _activeScreen =
          MealsScreen(meals: favMeals);
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
