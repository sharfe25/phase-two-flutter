
import 'rating_model.dart';

class ProductModel {
  final num id;
  final String title;
  final String image;
  final String category;
  final String description;
  final num price;
  final RatingModel rating;

  const ProductModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.category,
      required this.description,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: (json['id'] ?? 0) as num,
        title: json['title'].toString(),
        image: json['image'].toString(),
        category: json['category'].toString(),
        description: json['description'].toString(),
        price: (json['price'] ?? 0) as num,
        rating: RatingModel.fromJson(json['rating']));
  }

  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      title: '',
      image: '',
      category: '',
      description: '',
      price: 0,
      rating: RatingModel.empty(),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $title, price: $price)';
  }
}
