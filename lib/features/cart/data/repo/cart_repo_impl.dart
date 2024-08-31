

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/core/firebase/firestore_service.dart';

import 'package:fresh_fruits/features/cart/data/models/cart.dart';

import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final store = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, List<Cart>?>> fetchCustomerCart() async {
    String customerID = auth.currentUser!.uid;
    List<Cart> carts = [];
    try {
      var query = await store.collection(FireStoreService.Cart_Collection).where('customerID',isEqualTo: customerID).get();
      for (var doc in query.docs) {
        Cart cart = Cart.fromJson(doc.data());
        carts.add(cart);
      }
      return right(carts);
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

  @override
  Future<Either<Failure, void>> removeItemFromCart(Cart cart) async {
    try {
      await store.collection(FireStoreService.Cart_Collection).doc(cart.ID).delete();
      return right(null);
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

  @override
  Future<Either<Failure, void>> updateQuantity(Cart cartItem) async {
    try {
      await FirebaseFirestore.instance
          .collection(FireStoreService.Cart_Collection)
          .doc(cartItem.ID)
          .update({'quantity': cartItem.quantity});
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: 'Failed to update quantity: ${e.toString()}'));
    }
  }
}