import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../viewModel/sign_in_cubit/sign_in_cubit.dart';

class SignInInputSection extends StatelessWidget {
  const SignInInputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return Form(
      key: signInCubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Email',
            validator: validateEmail,
            onSaved: (email) => signInCubit.email = email!,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            hint: 'Password',
            validator: validatePassword,
            onSaved: (password) => signInCubit.password = password!,
            svgIconUrl: 'lib/assets/icons/password-icon.svg',
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
