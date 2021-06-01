import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/settings.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Settings _settings = Settings();
  List<Meal> _favorites = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _addFavorite(Meal meal) {
    setState(() {
      _favorites.contains(meal)
          ? _favorites.remove(meal)
          : _favorites.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(
              favorites: _favorites,
            ),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(
              _availableMeals,
            ),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(
              favorites: _favorites,
              addFavoriteFunction: _addFavorite,
            ),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals, _settings),
      },
      onUnknownRoute: (settings) {
        return CupertinoPageRoute(
          builder: (_) => CategoriesScreen(),
        );
      },
    );
  }
}
