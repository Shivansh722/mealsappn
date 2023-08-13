import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/caticon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void _selectCategory(BuildContext context, Caticon caticon) {

final filteredMeals = dummyMeals.where(
  (meal) => meal.categories.contains(caticon.id)).toList();


    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>  MealsScreen(
          title: caticon.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final caticon in availableCategories)
            CategoryGridItem(
              caticon: caticon,
              onSelectCaticon: () {
                _selectCategory(context, caticon);
              },
            ),
        ],
      ),
    );
  }
}
