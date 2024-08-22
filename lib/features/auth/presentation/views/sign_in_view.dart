import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fresh_fruits/features/auth/presentation/views/widgets/sign_in_view_body.dart';

import '../manger/sign_in_cubit/sign_in_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInViewBody();
  }
}
