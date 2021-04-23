import 'package:flutter/material.dart';
import '../widget/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        
      ),
      children: DUMMY_CATEGORIES
          .map(
            (categoriData) => CategoryItem(
              id: categoriData.id,
              title: categoriData.title,
              color: categoriData.color,
            ),
          )
          .toList(),
    );
  }
}
