import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:phase_two_flutter/services/product_service.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _productsByCategory = [];
  String? _titleProductsByCategory;
  final ProductService _productService;

  List<ProductModel> get products => _products;
  List<ProductModel> get productsByCategory => _productsByCategory;
  String? get titleProductsByCategory => _titleProductsByCategory;

  ProductProvider({required ProductService productService})
      : _productService = productService;

  void getAllProducts() async {
    final Either<List<ProductModel>, int> result =
        await _productService.getAllProducts();
    result.fold((List<ProductModel> left) {
      _products = left;
      notifyListeners();
    }, (int right) async {
      print('Error $right');
    });
  }

  void getProductsByCategory(
      {required String category, required BuildContext context}) async {
    _titleProductsByCategory = category;
    final Either<List<ProductModel>, int> result =
        await _productService.getProductsByCategory(category: category);
    result.fold((List<ProductModel> left) {
      _productsByCategory = left;
      Navigator.pushNamed(
        context,
        '/products_by_category',
      );
      notifyListeners();
    }, (int right) async {
      print('Error $right');
    });
  }
}
