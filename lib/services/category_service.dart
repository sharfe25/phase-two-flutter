import 'package:dartz/dartz.dart';

import '../core/api_paths.dart';
import '../core/http_adapter.dart';
import '../models/category_model.dart';

class CategoryService {
  Future<Either<List<CategoryModel>, int>> getAllCategories() async {
    final dynamic serviceUrl = ApiPaths.createUrl(
      path: ApiPaths.categories,
    );

    final Either<List<dynamic>?, int> result =
        await HTTPAdapter.get<List<dynamic>>(
      url: serviceUrl,
    );

    return result.fold(
      (List<dynamic>? leftValue) {
        if (leftValue == null) {
          return left([]);
        }
        List<CategoryModel> categories = [];
        for (final dynamic element in leftValue) {
          final categoryModel = CategoryModel(
            name: element.toString(),
          );
          categories.add(categoryModel);
          // ignore: avoid_print
          print(categoryModel.toString());
        }
        return left(categories);
      },
      (int rightValue) => right(rightValue),
    );
  }
}
