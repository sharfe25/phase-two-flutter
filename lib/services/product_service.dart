import 'package:dartz/dartz.dart';

import '../core/api_paths.dart';
import '../core/http_adapter.dart';
import '../models/product_model.dart';

class ProductService {
  Future<Either<List<ProductModel>, int>> getAllProducts() async {
    final dynamic serviceUrl = ApiPaths.createUrl(
      path: ApiPaths.products,
    );
    final Either<List<dynamic>?, int> result =
        await HTTPAdapter.get<List<dynamic>?>(
      url: serviceUrl,
    );

    return result.fold((List<dynamic>? leftValue) {
      if (leftValue == null) {
        return right(400);
      }
      List<ProductModel> products = [];
      for (final dynamic product in leftValue) {
        final producModel = ProductModel.fromJson(
          product as Map<String, dynamic>,
        );
        products.add(producModel);
        // ignore: avoid_print
        print(producModel.toString());
      }
      return left(
        products,
      );
    }, (int rightValue) {
      return right(rightValue);
    });
  }

  Future<Either<List<ProductModel>, int>> getProductsByCategory(
      {required String category}) async {
    final dynamic serviceUrl = ApiPaths.createUrl(
        path: ApiPaths.productsByCategory, pathVariables: category);
    final Either<List<dynamic>?, int> result =
        await HTTPAdapter.get<List<dynamic>?>(
      url: serviceUrl,
    );

    return result.fold((List<dynamic>? leftValue) {
      if (leftValue == null) {
        return right(400);
      }
      List<ProductModel> products = [];
      for (final dynamic product in leftValue) {
        final producModel = ProductModel.fromJson(
          product as Map<String, dynamic>,
        );
        products.add(producModel);
        // ignore: avoid_print
        print(producModel.toString());
      }
      return left(
        products,
      );
    }, (int rightValue) {
      return right(rightValue);
    });
  }
}
