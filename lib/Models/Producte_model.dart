class ProducteModel {
  int id;
  String title;
  final num price;
  String description;
  String category;
  String image;
  Rating rating;
  ProducteModel(
      {required this.category,
      required this.rating,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title});
  factory ProducteModel.fromjson(dynamic jsonData) {
    return ProducteModel(
        rating: Rating.fromjson(jsonData),
        price: jsonData['price'],
        category: jsonData['category'],
        description: jsonData['description'],
        id: jsonData['id'],
        image: jsonData["image"],
        title: jsonData['title']);
  }
}

class Rating {
  final double? rate;
  final int? count;
  Rating({required this.count, required this.rate});
  factory Rating.fromjson(jsonData) {
    return Rating(count: jsonData["count"], rate: jsonData['rate']);
  }
}
