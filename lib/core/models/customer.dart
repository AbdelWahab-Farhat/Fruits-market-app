import 'order.dart';

class Customer {
  final String ID;
  final String firstName;
  final String lastName;
  final String email;
  final List<Order>? orders;

  Customer({
    required this.ID,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.orders,  // List<Order> is nullable
  });

  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'orders': orders?.map((order) => order.toJson()).toList(), // Convert each Order to JSON
    };
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      ID: json['ID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      orders: (json['orders'] as List<dynamic>?)
          ?.map((orderJson) => Order.fromJson(orderJson as Map<String, dynamic>))
          .toList(),
    );
  }
}