import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/molecules/skeletons/products_grid_skeleton.dart';

import '../../models/product_model.dart';
import '../../utils/string_utils.dart';
import '../molecules/product_card.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A widget that displays a grid of products with a title.
///
/// The [ProductsGrid] widget arranges the given list of products in a grid layout,
/// with each product displayed as a card. It also includes a title above the grid.
class ProductsGrid extends StatelessWidget {
  /// The title to be displayed above the grid.
  final String title;

  /// The list of products to be displayed in the grid.
  final List<ProductModel> products;

  /// The load indicator.
  final bool isLoading;

  /// Creates a [ProductsGrid].
  ///
  /// The [title] and [products] parameters are required.
  const ProductsGrid(
      {Key? key,
      required this.title,
      required this.products,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the title text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              StringUtils.capitalize(title),
              style: AppTextStyles.subtitle,
            ),
          ),
          //Display the skeleton
          if (isLoading) const ProductsGridSkeleton(),
          // Display the grid of product cards
          if (!isLoading)
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
        ],
      ),
    );
  }
}
