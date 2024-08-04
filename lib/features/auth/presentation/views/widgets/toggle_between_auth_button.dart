import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class ToggleBetweenAuthButton extends StatelessWidget {
  final bool isSignInView;
  const ToggleBetweenAuthButton({
    super.key,
    required this.isSignInView,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSignInView ? "Don't Have an Account?" : "Have an Account?",
          style: AppStyle.style14,
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(isSignInView? AppRouter.signUpViewPath:AppRouter.signInViewPath),
          child: Text(
            isSignInView ? 'Sign Up Now' : 'Sign In Now',
            style: AppStyle.style14.copyWith(color: kOrange),
          ),
        ),
      ],
    );
  }
}
