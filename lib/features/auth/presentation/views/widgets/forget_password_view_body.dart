import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_style.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/core/widgets/custom_outlined_button.dart';
import 'package:fresh_fruits/core/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../viewModel/sign_in_cubit/sign_in_cubit.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signInCubit = context.read<SignInCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightYellow,
        title: const Text(
          'Reset Password',
          style: AppStyle.style24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key:  signInCubit.formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter Your Email Address',
              style: AppStyle.style20.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(hint: 'Email',
              validator: validateEmail,
              onSaved: (email) => signInCubit.email = email!,
            ),
            const Expanded(child: SizedBox(height: 50,)),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccess) {
                  showTopSnackBar(context, state.successMessage,durationSeconds: 4);
                  GoRouter.of(context).pop();
                } else if (state is SignInFailure) {
                  showTopSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                if (state is SignInLoading) {
                  return const CustomLoadingWidget();
                }
                return CustomOutlinedButton(
                  title: 'Confirm',
                  onTap: () {
                    sendEmailAndResetPassword(signInCubit);
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  void sendEmailAndResetPassword(SignInCubit signInCubit) {
    if (signInCubit.formKey.currentState!.validate()) {
      signInCubit.formKey.currentState!.save();
      signInCubit.sendEmailResetPassword(
          email: signInCubit.email);
    }
  }
}
