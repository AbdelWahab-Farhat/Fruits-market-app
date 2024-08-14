import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../error/failure.dart';
import '../models/item.dart';

class FireStoreService {
  // Collections Names
  static const items_Collection = 'Items';

  Future<Either<Failure,List<Item>>> fetchItems()async{
    try {
      final snapShot = await FirebaseFirestore.instance.collection(items_Collection).get();
      return right(snapShot.docs.map((e) => Item.fromJson(e.data()),).toList());
    } on FirebaseException catch(e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }
}
