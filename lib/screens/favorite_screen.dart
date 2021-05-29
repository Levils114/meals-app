import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorites;

  const FavoriteScreen(
    this.favorites,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (_, index) => MealItemWidget(
        meal: favorites[index],
      ),
    );
  }
}
