import 'package:flutter/material.dart';
import '../../models/category_model.dart';

/// A widget that displays a category card.
/// 
/// This widget takes a [CategoryModel] as a parameter and displays
/// its name inside a [Card] widget.
class CategoryCardWidget extends StatelessWidget {
  /// The category data to be displayed.
  final CategoryModel category;

  /// Creates a [CategoryCardWidget].
  /// 
  /// The [category] parameter must not be null and is required.
  const CategoryCardWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(category.name), // Displays the name of the category
        ],
      ),
    );
  }
}
