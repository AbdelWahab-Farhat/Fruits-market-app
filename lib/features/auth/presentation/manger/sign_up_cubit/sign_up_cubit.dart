import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  late final String email;
  late final String password;
  late final String firstName;
  late final String lastName;
  final formKey = GlobalKey<FormState>();

  SignUpCubit(this.authRepo) : super(SignUpInitial());

  void signUp() async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    result.fold(
        (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
        (successMessage) =>
            emit(SignUpSuccess(successMessage: successMessage)));
  }
}
