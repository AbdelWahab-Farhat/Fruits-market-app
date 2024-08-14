import 'package:fresh_fruits/core/models/category_item.dart';

class Item {
  final String ID;
  final String name;
  final String imageURL;
  final CategoryItem category;
  final double price;
  final double rate;
  final int reviews;

  Item({required this.ID,
    required this.name,
    required this.imageURL,
    required this.category,
    required this.price,
    required this.rate,
    required this.reviews});

  Map<String, dynamic> toJson() {
    return {
      "ID": ID,
      "name": name,
      "imageURL": imageURL,
      "category": category.toJson(),
      "price": price,
      "rate": rate,
      "reviews": reviews,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      ID: json["ID"],
      name: json["name"],
      imageURL: json["imageURL"],
      category: CategoryItem.fromJson(json["category"]),
      price: (json["price"] as num).toDouble(),
      rate: (json["rate"] as num).toDouble(),
      reviews: (json["reviews"] as num).toInt(),
    );
  }
}


