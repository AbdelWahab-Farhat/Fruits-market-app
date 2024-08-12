import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import 'sign_in_input_section.dart';
import 'toggle_between_auth_button.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28,right: 28,top: 28,bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sign In',style: AppStyle.style20,),
          const SizedBox(height: 32,),
          const SignInInputSection(),
          const SizedBox(height: 12,),
          Align(
              alignment: Alignment.centerRight,
              child: Text('Forget Password ?',style: AppStyle.style14.copyWith(color: kOrange),)),
          const Expanded(child: SizedBox(height: 20,)),
           CustomFilledButton(title: 'Sign In',onTap: () => GoRouter.of(context).go(AppRouter.cartView),),
          const SizedBox(height: 10,),
          const ToggleBetweenAuthButton(isSignInView: true,),
        ],
      ),
    );
  }
}

