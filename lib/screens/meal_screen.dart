import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';

class MealScreen extends StatelessWidget {
  final Meal meal;
  const MealScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image(image: NetworkImage(meal.imageUrl)),
    );
  }
}
