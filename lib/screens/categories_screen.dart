import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/wedges/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final Function(Meal meal) onChangeFav;
  final List<Meal>meals;
  const CategoriesScreen({super.key,required this.onChangeFav,required this.meals});

  void selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals,onChangeFav: onChangeFav,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5),
      children: [
        for (final category in availableCategories)
          CategoryItem(
              categoryModel: category,
              selectCategory: () {
                selectCategory(context, category);
              })
      ],
    );
  }
}
