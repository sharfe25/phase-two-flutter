import 'package:flutter/material.dart';
import 'package:phase_two_flutter/components/tokens/app_spacing.dart';
import 'package:phase_two_flutter/components/tokens/app_text_styles.dart';
import 'package:phase_two_flutter/models/product_model.dart';
import '../tokens/app_colors.dart';

/// A widget that displays a product card with an image, title, and price.
///
/// The [ProductCard] is used to display product details in a card layout,
/// including the product image, title, and price.
class ProductCard extends StatelessWidget {
  /// The product data to be displayed.
  final ProductModel product;

  /// Creates a [ProductCard].
  ///
  /// The [product] parameter must not be null and is required.
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the product image
        Container(
          width: 200,
          height: 210,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(product.image),
            ),
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Display the product title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            product.title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: AppSpacing.medium,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // Display the product price
        Expanded(
          child: Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
