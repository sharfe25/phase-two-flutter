import '../.env/api_env.dart';

class ApiPaths {
  static String categories = 'products/categories';
  static String products = 'products';
  static String productsByCategory = 'products/category/';

  static String createUrl({required String path, String pathVariables = ''}) {
    String baseUrl = ApiEnv.apiUrl;
    return '$baseUrl$path$pathVariables';
  }
}
