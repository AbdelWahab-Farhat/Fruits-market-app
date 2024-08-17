import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fresh_fruits/features/auth/presentation/viewModel/sign_up_cubit/sign_up_cubit.dart';
import 'package:fresh_fruits/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepoImpl()),
      child: const SignUpViewBody(),
    );
  }
}


