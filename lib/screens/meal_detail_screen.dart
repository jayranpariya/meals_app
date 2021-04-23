import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function isFavorite;
  final Function toggleFavorite;
  MealDetailScreen({this.toggleFavorite, this.isFavorite});
  static const routName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );
    var ingredientsList = ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(selectedMeal.ingredients[index]),
          ),
        );
      },
      itemCount: selectedMeal.ingredients.length,
    );
    var stepsList = ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index + 1)}'),
            ),
            title: Text(selectedMeal.steps[index]),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
      itemCount: selectedMeal.steps.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            BuildContainer(
              ingredientsList,
            ),
            buildSectionTitle(context, 'steps'),
            BuildContainer(
              stepsList,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   Navigator.of(context).pop(mealId);
        // },
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
    ),
  );
}

Widget BuildContainer(Widget child) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 150,
    width: 300,
    child: child,
  );
}
