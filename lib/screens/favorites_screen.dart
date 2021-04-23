import 'package:flutter/material.dart';
import 'package:meals_app/widget/meals_item.dart';
import '../models/meal.dart';

class FavoritesScareen extends StatelessWidget {
  final List<Meal> favoriteMelas;
  FavoritesScareen(this.favoriteMelas);
  @override
  Widget build(BuildContext context) {
    if (favoriteMelas.isEmpty) {
      return Center(
        child: Text('FavoritesScareen'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: favoriteMelas[index].id,
            title: favoriteMelas[index].title,
            imageUrl: favoriteMelas[index].imageUrl,
            duration: favoriteMelas[index].duration,
            complexity: favoriteMelas[index].complexity,
            affordability: favoriteMelas[index].affordability,
           );
        },
        itemCount: favoriteMelas.length,
      );
    }
  }
}
