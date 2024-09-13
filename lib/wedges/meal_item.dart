import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/wedges/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(15),
      clipBehavior: Clip.hardEdge, // cut anything out of the card border
      elevation: 2, // for shadow
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Stack(
          // ignore the shape i put on the card
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: Column(
                  children: [
                    Text(
                      maxLines: 2, // max lines is 2 else will be cut off
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // add ...
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        SizedBox(width: 5,),
                        MealItemTrait(icon: Icons.work, label:complexityText ),
                        SizedBox(width: 5,),
                        MealItemTrait(icon: Icons.monetization_on, label:complexityText ),
                        SizedBox(width: 5,),
                        
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
