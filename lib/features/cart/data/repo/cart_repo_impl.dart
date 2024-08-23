

import 'package:dartz/dartz.dart';

import 'package:fresh_fruits/core/error/failure.dart';

import 'package:fresh_fruits/features/cart/data/models/cart.dart';

import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  @override
  Future<Either<Failure, List<Cart>?>> fetchCustomerCart(Cart cart) {
    // TODO: implement fetchCustomerCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeItemFromCart(Cart cart) {
    // TODO: implement removeItemFromCart
    throw UnimplementedError();
  }

}