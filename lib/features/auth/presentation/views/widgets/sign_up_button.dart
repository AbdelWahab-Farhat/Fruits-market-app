import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utility/app_router.dart';
import '../../../../../core/utility/helper.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../manger/sign_up_cubit/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showTopSnackBar(context, state.successMessage);
          GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
        } else if (state is SignUpFailure) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const CustomLoadingWidget();
        }
        var signUpCubit = context.read<SignUpCubit>();
        return CustomFilledButton(
          title: 'Sign Up',
          onTap: () {
            var isValid = signUpCubit.formKey.currentState!.validate();
            if (isValid) {
              signUpCubit.formKey.currentState!.save();
              signUpCubit.signUp();
            }
          },
        );
      },
    );
  }
}
