class ProductModel {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  String? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;


  ProductModel();

  ProductModel.fromJson(Map<String, dynamic> map) {
    if (map["id"] != null) {
      id = map["id"];
    }
    if (map["title"] != null) {
      title = map["title"];
    }
    if (map["description"] != null) {
      description = map["description"];
    }
    if (map["price"] != null) {
      price = map["price"];
    }
    if (map["discountPercentage"] != null) {
      discountPercentage = map["discountPercentage"];
    }
    if (map["rating"] != null) {
      rating = map["rating"].toString();
    }
    if (map["stock"] != null) {
      stock = map["stock"];
    }
    if (map["brand"] != null) {
      brand = map["brand"];
    }
    if (map["category"] != null) {
      category = map["category"];
    }
    if (map["thumbnail"] != null) {
      thumbnail = map["thumbnail"];
    }
  }
}
