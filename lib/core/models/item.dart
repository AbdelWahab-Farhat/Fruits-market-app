import 'package:fresh_fruits/core/models/category_item.dart';

import '../../features/item_details/data/models/comment.dart';

class Item {
  final String ID;
  final String name;
  final String imageURL;
  String? description;
  final CategoryItem category;
  final double price;
  final double rate;
  final int reviews;
   List<Comment>? comments;

  Item(
    {required this.ID,
    required this.name,
    required this.imageURL,
    required this.category,
    required this.price,
    this.rate = 0.0,
    required this.reviews,
    this.comments,
      required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "ID": ID,
      "name": name,
      "imageURL": imageURL,
      "category": category.toJson(),
      "price": price,
      "rate": rate,
      "reviews": reviews,
      "description": description,
      "comments": comments?.map((e) => e.toJson(),).toList(),
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
      description: json["description"],
      comments: (json["comments"] as List?)?.map((e) => Comment.fromJson(e),).toList(),
    );
  }
}


