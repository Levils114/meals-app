import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorites;

  TabsScreen({this.favorites});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _screens = [
      {'title': 'Lista de Categorias', 'widget': CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'widget': FavoriteScreen(
          widget.favorites,
        )
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
