import 'package:flutter/material.dart';
import 'package:meals/models/caticon.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.caticon,
    required this.onSelectCaticon,
    
  });

  final Caticon caticon;
  final void Function() onSelectCaticon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCaticon();
      },

      splashColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.12),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              caticon.color.withOpacity(0.5),
              caticon.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          caticon.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
