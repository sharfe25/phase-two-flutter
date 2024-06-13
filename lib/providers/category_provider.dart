import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  bool _isLoading = false;
  List<CategoryModel> _categories = [];
  final CategoryService _categoryService;

  CategoryProvider({required CategoryService categoryService})
      : _categoryService = categoryService;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> getAllCategories() async {
    _isLoading = true;
    notifyListeners();
    final Either<List<CategoryModel>, int> result =
        await _categoryService.getAllCategories();
    result.fold((List<CategoryModel> left) {
      _categories = left;
      _isLoading = false;
      notifyListeners();
    }, (int right) async {
      // ignore: avoid_print
      print('Error $right');
      _isLoading = false;
      notifyListeners();
    });
  }
}
