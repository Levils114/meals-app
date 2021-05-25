import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (_) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
      },
    );
  }
}
