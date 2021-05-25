import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/utils/app_routes.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({this.category});

  void _selectCategory(BuildContext context) {
    /* Navigator.of(context).push(CupertinoPageRoute(
      builder: (_) => CategoriesMealsScreen(category: category),
    )); */

    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: (Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      )),
    );
  }
}
