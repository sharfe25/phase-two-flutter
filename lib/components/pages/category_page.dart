// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../organism/products_grid.dart';
import '../templates/dashboard_template.dart';
import '../tokens/app_spacing.dart';

/// A screen that displays products belonging to a specific category.
///
/// The [CategoryPage] widget fetches products belonging to a specific category
/// using a [ProductProvider] and displays them using a [ProductsGrid].
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the product provider
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: true);
    
    // Return the dashboard template with the category products
    return DashboardTemplate(
      title: 'Category',
      onTapBack: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the products grid with the category title and count
            const SizedBox(
              height: AppSpacing.small,
            ),
            ProductsGrid(
              isLoading: productProvider.isLoading,
              title: '${productProvider.titleProductsByCategory} (${productProvider.productsByCategory.length})',
              products: productProvider.productsByCategory,
            ),
          ],
        ),
      ),
    );
  }
}
