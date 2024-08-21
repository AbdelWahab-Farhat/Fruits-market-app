import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/core/firebase/firestore_service.dart';
import 'package:fresh_fruits/core/models/customer.dart';
import 'package:fresh_fruits/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {

  @override
  Future<Either<Failure, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Create a new user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Try to add user info to the database
      var result = await FireStoreService.addUserInfoToDataBase(
        firstName: firstName,
        lastName: lastName,
        email: email,
        ID: userCredential.user!.uid,
      );

      // If adding user info fails, delete the auth info
      if (!result) {
        await userCredential.user?.delete(); // Delete the created user
        return left(ServerFailure(errMessage: 'Failed to add user info.'));
      }

      // Return success message
      return const Right('Account Created Successfully');
    } on FirebaseAuthException catch (e) {
      // Handle different FirebaseAuth errors
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use by another account.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }
      return Left(ServerFailure(errMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errMessage: 'An unknown error occurred.'));
    }
  }

  @override
  Future<Either<Failure, Customer>> signIn({required String email, required String password}) async {
    try {
      var doc = await FirebaseFirestore.instance.collection(FireStoreService.users_Collection).doc(FirebaseAuth.instance.currentUser!.uid).get();
      return right(Customer.fromJson(doc.data() as Map<String, dynamic>));
    } on FirebaseAuthException {
      return left(ServerFailure(errMessage: 'An unknown error occurred , Please Try Again Later.'));

    }
  }

  @override
  Future<Either<Failure, String>> sendEmailResetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? 'An unknown error occurred , Please Try Again Later.'));
    }
  }
}
