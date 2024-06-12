import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../molecules/home/welcome_card.dart';
import '../organism/home/categories.dart';
import '../organism/products_grid.dart';
import '../templates/dashboard_template.dart';

/// A screen that serves as the home page of the application.
///
/// The [HomePage] widget displays a welcome card, a list of categories,
/// and a grid of products. It uses a [ProductProvider] to fetch and manage
/// product data.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    
    // Initialize the product provider and fetch all products
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardTemplate(
      onTapBag: () => Navigator.pop(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the welcome card
            const WelcomeCard(),
            // Display the categories
            Categories(productProvider: productProvider),
            // Display the products grid with new arrivals
            ProductsGrid(
              title: 'New Arrival',
              // Retrieve products using the product provider
              products: context.watch<ProductProvider>().products,
            ),
          ],
        ),
      ),
    );
  }
}
