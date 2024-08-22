import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/apis/world_time_api.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/firebase/firestore_service.dart';
import '../../../../core/models/customer.dart';
import '../../../../core/models/item.dart';
import '../models/comment.dart';
import 'item_details_repo.dart';


class ItemDetailsRepoImpl extends ItemDetailsRepo {
  @override
  Future<Either<Failure, String>> postComment(
      String content, Customer customer, Item item) async {
    try {
      var store = FirebaseFirestore.instance;
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
      var query = await FirebaseFirestore.instance.collection(FireStoreService.items_Collection).doc(item.ID).get();
      print(query.data().toString());
       Item ite = Item.fromJson(query.data() as Map<String, dynamic>);
      return right(ite.comments);
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }
}
