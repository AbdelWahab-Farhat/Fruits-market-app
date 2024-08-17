import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_filled_button.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utility/app_router.dart';
import '../../viewModel/sign_in_cubit/sign_in_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showTopSnackBar(context, state.successMessage);
          GoRouter.of(context).pushReplacement(AppRouter.rootView);
        } else if (state is SignInFailure) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const CustomLoadingWidget();
        }
        return CustomFilledButton(title: 'Sign In',
          onTap: () {
            if (signInCubit.formKey.currentState!.validate()) {
              signInCubit.formKey.currentState!.save();
              print(signInCubit.email);
              print(signInCubit.password);
              signInCubit.signIn(email: signInCubit.email, password: signInCubit.password);
            }
          },);
      },
    );
  }
}
