import 'category_item.dart';
import 'item.dart';

class Order extends Item {
  final int quantity;
  final DateTime orderDate;

  Order({
    required super.ID,
    required super.name,
    required super.imageURL,
    required super.category,
    required super.price,
    required super.rate,
    required super.reviews,
    required this.quantity,
    required this.orderDate,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();  // Call toJson() from the parent class
    json['quantity'] = quantity;
    json['orderDate'] = orderDate.toIso8601String();  // Convert DateTime to ISO8601 string
    return json;
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      ID: json['ID'],
      name: json['name'],
      imageURL: json['imageURL'],
      category: CategoryItem.fromJson(json['category']),
      price: (json['price'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      reviews: (json['reviews'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate']),  // Parse ISO8601 string to DateTime
    );
  }
}
