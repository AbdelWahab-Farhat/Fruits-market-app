import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/auth/presentation/views/widgets/sign_in_button.dart';
import '../../../../../core/utility/app_style.dart';
import 'forget_password_button.dart';
import 'sign_in_input_section.dart';
import 'toggle_between_auth_button.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 28,left:  28 , top: 20 , bottom: 32),
            child: Text('Sign In', style: AppStyle.style20,),
          ),
        ),
         const SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(left: 28,right: 28,bottom: 32),
            child: Column(
              children: [
                SignInInputSection(),
                SizedBox(height: 10,),
                ForgetPasswordButton(),
                SizedBox(height: 12,),
                Expanded(child: SizedBox(height: 10,)),
                SignInButton(),
                SizedBox(height: 20,),
                ToggleBetweenAuthButton(isSignInView: true,),
              ],
            ),
          ),
        )
      ],
    );
  }
}




