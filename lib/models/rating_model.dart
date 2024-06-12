class RatingModel {
  final num rate;
  final num count;

  const RatingModel({
    required this.rate,
    required this.count
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] ?? 0) as num,
      count: (json['count'] ?? 0) as num,
    );
  }

  factory RatingModel.empty() {
    return const RatingModel(
      rate: 0,
      count: 0,
    );
  }
}
