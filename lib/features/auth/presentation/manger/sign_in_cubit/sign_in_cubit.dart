import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/customer.dart';
import '../../../data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  Customer? customer;
  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();
  SignInCubit(this.authRepo) : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (errMessage) => emit(SignInFailure(errMessage.errMessage)),
      (customer) {
        customer = customer;
        emit(SignInSuccess(successMessage: 'Sign In Successful'));
      },
    );
  }
  Future<void> sendEmailResetPassword({required String email}) async {
    emit(SignInLoading());
    var result = await authRepo.sendEmailResetPassword(email: email);
    result.fold(
      (errMessage) => emit(SignInFailure(errMessage.errMessage)),
      (successMessage) => emit(SignInSuccess(successMessage: successMessage)),
    );
  }

  void setCustomer(Customer customer) {
    customer = customer;
  }
}
