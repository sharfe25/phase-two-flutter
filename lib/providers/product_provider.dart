import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

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

  Future<void> getAllProducts() async {
    final Either<List<ProductModel>, int> result =
        await _productService.getAllProducts();
    result.fold((List<ProductModel> left) {
      _products = left;
      notifyListeners();
    }, (int right) async {
      print('Error $right');
    });
  }

  Future<void> getProductsByCategory(
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
