import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/core/models/customer.dart';

import '../../../../core/models/item.dart';

abstract class ItemDetailsRepo {
  Future<Either<Failure, String>> postComment(String content , Customer customer,Item item);
}

