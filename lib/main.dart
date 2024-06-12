import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/category_provider.dart';
import 'providers/product_provider.dart';
import 'routes.dart';
import 'services/category_service.dart';
import 'services/product_service.dart';

void main() async{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                CategoryProvider(categoryService: CategoryService())),
        ChangeNotifierProvider(create: (_) => ProductProvider(productService: ProductService())),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
        debugShowCheckedModeBanner: false,
        title: 'Phase Two',
      ),
    );
  }
}
