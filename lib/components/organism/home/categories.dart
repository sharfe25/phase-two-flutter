import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/molecules/skeletons/categories_skeleton.dart';
import 'package:provider/provider.dart';

import '../../../providers/category_provider.dart';
import '../../../providers/product_provider.dart';
import '../../molecules/home/category_carousel.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_text_styles.dart';

/// A widget that displays a list of categories using a carousel.
///
/// The [Categories] widget fetches category data from a [CategoryProvider]
/// and displays them using a [CategoryCarousel]. It also provides a title
/// for the list of categories.
class Categories extends StatefulWidget {
  /// The provider for product data.
  final ProductProvider productProvider;

  /// Creates a [Categories] widget.
  ///
  /// The [productProvider] parameter is required.
  const Categories({Key? key, required this.productProvider}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
    // Fetch all categories when the widget is initialized
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the category provider
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the title text for categories
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.small),
            child: Text(
              'Categories',
              style: AppTextStyles.subtitle,
            ),
          ),
          // Display the skeleton
          if (categoryProvider.isLoading) const CategoriesSkeleton(),
          // Display the category carousel
          if (!categoryProvider.isLoading)
            CategoryCarousel(
              categoryProvider: categoryProvider,
              productProvider: widget.productProvider,
            ),
        ],
      ),
    );
  }
}
