

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/cart.dart';
abstract class CartRepo {
  Future<Either<Failure,List<Cart>?>> fetchCustomerCart(Cart cart);
  Future<Either<Failure,void>> removeItemFromCart(Cart cart);
}