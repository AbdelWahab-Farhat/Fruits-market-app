import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import 'sign_up_input_section.dart';
import 'toggle_between_auth_button.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 28, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: AppStyle.style20,
          ),
          const SizedBox(
            height: 32,
          ),
          const SignUpInputSection(),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppStyle.style14,
                children: [
                  const TextSpan(text: 'By tapping Sign up you accept all '),
                  TextSpan(
                    text: 'terms and conditions',
                    style: AppStyle.style14.copyWith(color: kOrange),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      },
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          const CustomFilledButton(title: 'Sign Up'),
          const SizedBox(
            height: 10,
          ),
          const ToggleBetweenAuthButton(
            isSignInView: false,
          ),
        ],
      ),
    );
  }
}
