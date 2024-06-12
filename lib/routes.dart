import 'package:flutter/material.dart';


import 'components/pages/category_page.dart';
import 'components/pages/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePage(),
  '/products_by_category': (context) => const CategoryPage(),
};
