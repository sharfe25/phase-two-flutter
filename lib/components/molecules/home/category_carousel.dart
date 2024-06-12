import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/atoms/chip_widget.dart';
import 'package:phase_two_flutter/components/tokens/app_spacing.dart';

import '../../../providers/category_provider.dart';
import '../../../providers/product_provider.dart';

/// A widget that displays a horizontal carousel of category chips.
///
/// The [CategoryCarousel] widget fetches category data from a [CategoryProvider]
/// and displays each category as a chip. Tapping on a chip triggers the retrieval
/// of products belonging to that category using a [ProductProvider].
class CategoryCarousel extends StatelessWidget {
  /// The provider for category data.
  final CategoryProvider categoryProvider;

  /// The provider for product data.
  final ProductProvider productProvider;

  /// Creates a [CategoryCarousel].
  ///
  /// The [categoryProvider] and [productProvider] parameters are required.
  const CategoryCarousel({
    super.key,
    required this.categoryProvider,
    required this.productProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
      height: 50,
      child: ListView.separated(
        itemCount: categoryProvider.categories.length,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: AppSpacing.medium,
          );
        },
        itemBuilder: (context, index) {
          final String categoryName = categoryProvider.categories[index].name;
          return ChipWidget(
            title: categoryName,
            onTap: () => productProvider.getProductsByCategory(
              category: categoryName,
              context: context,
            ),
          );
        },
      ),
    );
  }
}
