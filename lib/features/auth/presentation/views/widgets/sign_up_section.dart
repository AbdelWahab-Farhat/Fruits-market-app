import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/auth/presentation/views/widgets/sign_up_button.dart';
import '../../../../../core/utility/app_style.dart';
import 'sign_up_input_section.dart';
import 'terms_and_conditions.dart';
import 'toggle_between_auth_button.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 28,left:  28 , top: 20),
            child: Text(
              'Sign Up',
              style: AppStyle.style20,
            ),
          ),
        ),

        const SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUpInputSection(),
                SizedBox(height: 12),
                TermsAndConditions(),
                Expanded(child: SizedBox(height: 20)),
                SignUpButton(),
                SizedBox(height: 10),
                ToggleBetweenAuthButton(
                  isSignInView: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

