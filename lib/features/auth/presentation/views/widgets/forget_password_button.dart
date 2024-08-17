import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_router.dart';
import '../../../../../core/utility/app_style.dart';


class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  GoRouter.of(context).push(AppRouter.forgetPasswordView),
      child: Align(
          alignment: Alignment.centerRight,
          child: Text('Forget Password ?',style: AppStyle.style14.copyWith(color: kOrange),)),
    );
  }
}