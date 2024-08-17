import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password
      });
  Future<Either<Failure, String>> signIn({required String email, required String password});
  Future<Either<Failure, String>> sendEmailResetPassword({required String email});
}
