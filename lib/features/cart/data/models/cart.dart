import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';

import '../../../../core/models/category_item.dart';
import '../../../../core/models/item.dart';

class Cart extends Item {
   int quantity;
  final String customerID;
  Cart(
      {required super.ID,
      required super.name,
      required super.imageURL,
      required super.category,
      required super.price,
      required super.reviews,
      required super.description,
        required this.quantity,
        required this.customerID
      });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['quantity'] = quantity;
    json['customerID'] = customerID;
    return json;
  }
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      ID: json['ID'],
      name: json['name'],
      imageURL: json['imageURL'],
      category: CategoryItem.fromJson(json['category']),
      price: (json['price'] as num).toDouble(),
      reviews: (json['reviews'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'],
      customerID: json['customerID'],
    );
  }

  totalPrice() => price * quantity;
  removeItem(BuildContext context) {
    return context.read<CartCubit>().removeItemFromCart(this);
  }
}
