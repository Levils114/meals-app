import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> _meals;

  const CategoriesMealsScreen(this._meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals =
        _meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (_, index) => MealItemWidget(
          meal: categoryMeals[index],
        ),
      ),
    );
  }
}
