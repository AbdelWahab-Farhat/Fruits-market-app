import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/models/customer.dart';
import 'package:uuid/uuid.dart';
import '../error/failure.dart';
import '../models/item.dart';

class FireStoreService {
  // Collections Names
  static const items_Collection = 'Items';
  static const users_Collection = 'Users';
  static const comments_Collection = 'Comments';

  static Future<Either<Failure, List<Item>>> fetchItems() async {
    try {
      final snapShot =
          await FirebaseFirestore.instance.collection(items_Collection).get();
      return right(snapShot.docs
          .map(
            (e) => Item.fromJson(e.data()),
          )
          .toList());
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

  static Future<bool> addUserInfoToDataBase(
      {required String firstName,
      required String lastName,
      required String email,
      required String ID,
      }) async {
    Customer customer = Customer(
        ID: ID,
        firstName: firstName,
        lastName: lastName,
        email: email);
    try {
      await FirebaseFirestore.instance
          .collection(users_Collection)
          .doc(customer.ID)
          .set(customer.toJson());
      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }

  static Future<Customer> fetchUserInfo(String uid) async {
    final snapShot = await FirebaseFirestore.instance
        .collection(users_Collection)
        .doc(uid)
        .get();
    return Customer.fromJson(snapShot.data() as Map<String, dynamic>);
  }
}



