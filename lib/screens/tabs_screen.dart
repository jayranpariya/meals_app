import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widget/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';
import '../models/meal.dart';

class TabsScareen extends StatefulWidget {
  final List<Meal> favoriteMelas;
  TabsScareen(this.favoriteMelas);

  @override
  _TabsScareenState createState() => _TabsScareenState();
}

class _TabsScareenState extends State<TabsScareen> {
  List<Map<String, dynamic>> _pages;
  int _selectpageindex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScareen(widget.favoriteMelas),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectpage(int index) {
    setState(() {
      _selectpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectpageindex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectpageindex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            // label: 'categories',
            title: Text(
              "categories",
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            // label: 'Favorites',
            title: Text(
              "Favorites",
            ),
          ),
        ],
        onTap: _selectpage,
      ),
    );
  }
}
