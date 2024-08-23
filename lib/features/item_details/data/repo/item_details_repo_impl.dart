import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/apis/world_time_api.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/firebase/firestore_service.dart';
import '../../../../core/models/customer.dart';
import '../../../../core/models/item.dart';
import '../../../cart/data/models/cart.dart';
import '../models/comment.dart';
import 'item_details_repo.dart';

class ItemDetailsRepoImpl extends ItemDetailsRepo {
  var store = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, String>> postComment(
      String content, Customer customer, Item item) async {
    try {
      var date = await WorldTimeApi().fetchWorldTime();
      var comment = Comment(
        ID: const Uuid().v7(),
        customerID: customer.ID,
        content: content,
        dateTime: date,
        customerName: "${customer.firstName} ${customer.lastName}",
      );

      // Add the comment to the comments collection
      await store
          .collection(FireStoreService.comments_Collection)
          .doc(comment.ID)
          .set(comment.toJson());

      // Update the item with the new comment
      item.comments ??= [];
      item.comments!.add(comment);

      await store
          .collection(FireStoreService.items_Collection)
          .doc(item.ID)
          .update({
        'comments': item.comments!.map((e) => e.toJson()).toList(),
      });

      return right('Comment Posted Successfully');
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    } catch (e) {
      // Handle any other unexpected exceptions
      return left(ServerFailure(errMessage: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Comment>?>> getItemComments(Item item) async {
    try {
      var query = await store
          .collection(FireStoreService.items_Collection)
          .doc(item.ID)
          .get();
      Item ite = Item.fromJson(query.data() as Map<String, dynamic>);
      return right(ite.comments);
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

  @override
  Future<Either<Failure, String>> ratingItem(Item item, double rate) async {
    try {
      var query = await store
          .collection(FireStoreService.items_Collection)
          .doc(item.ID)
          .get();
      Item updatedItem = Item.fromJson(query.data() as Map<String, dynamic>);
      await store
          .collection(FireStoreService.items_Collection)
          .doc(item.ID)
          .update({
        'rate': updatedItem.rate + rate,
        'reviews': updatedItem.reviews + 1
      });
      return right('Rate Item Successfully');
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

  @override
  Future<Either<Failure, String>> addItemToCart(
      Item item, int quantity, Customer customer) async {
    Cart cart = Cart(
        ID: const Uuid().v6(),
        name: item.name,
        imageURL: item.imageURL,
        category: item.category,
        price: item.price,
        reviews: item.reviews,
        description: item.description,
        quantity: quantity,
        customerID: customer.ID);
    try {
      var query = await store
          .collection(FireStoreService.Cart_Collection)
          .where("customerID", isEqualTo: customer.ID)
          .get();

      bool itemExists = false;

      for (var doc in query.docs) {
        Cart cartItemInDataBase = Cart.fromJson(doc.data());
        bool isCartItemExist = cartItemInDataBase.name == cart.name &&
            cartItemInDataBase.price == cart.price &&
            cartItemInDataBase.imageURL == cart.imageURL;

        if (isCartItemExist) {
          itemExists = true;
          // Increment the quantity of the existing cart item
          int newQuantity = cartItemInDataBase.quantity + quantity;
          await store
              .collection(FireStoreService.Cart_Collection)
              .doc(doc.id) // Use the document ID of the existing item
              .update({'quantity': newQuantity});
          break;
        }
      }
      if (!itemExists) {
        // Add a new cart item if it doesn't exist
        await store
            .collection(FireStoreService.Cart_Collection)
            .doc(cart.ID)
            .set(cart.toJson());
      }

      return right('Item added to cart successfully');
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }
}
