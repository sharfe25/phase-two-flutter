import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  final CategoryService _categoryService;

  CategoryProvider({required CategoryService categoryService})
      : _categoryService = categoryService;

  List<CategoryModel> get categories => _categories;

  Future<void> getAllCategories() async {
    final Either<List<CategoryModel>, int> result =
        await _categoryService.getAllCategories();
    result.fold((List<CategoryModel> left) {
      _categories = left;
      notifyListeners();
    }, (int right) async {
      print('Error $right');
    });
  }
}
