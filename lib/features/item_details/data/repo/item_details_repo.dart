import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/core/models/customer.dart';
import 'package:fresh_fruits/features/item_details/data/models/comment.dart';

import '../../../../core/models/item.dart';

abstract class ItemDetailsRepo {
  Future<Either<Failure, String>> postComment(String content , Customer customer,Item item);
  Future<Either<Failure, List<Comment>?>> getItemComments(Item item);
  Future<Either<Failure,String>> ratingItem(Item item,double rate);
  Future<Either<Failure,String>> addItemToCart(Item item, int quantity,Customer customer);

}

