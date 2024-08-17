import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:fresh_fruits/features/auth/presentation/viewModel/sign_up_cubit/sign_up_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var signUpCubit = context.read<SignUpCubit>();
    return  Form(
      key: signUpCubit.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: CustomTextFormField(hint: 'First Name',
                validator: validateFirstName,
                onSaved: (inputUserName) => signUpCubit.firstName = inputUserName!,
              )),
              const SizedBox(
                width: 19,
              ),
              Expanded(child: CustomTextFormField(hint: 'Last Name'
                ,validator: validateLastName,
                onSaved: (inputLastName) => signUpCubit.lastName = inputLastName!,
              )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(hint: 'Email',
          validator:  validateEmail,
            onSaved: (inputEmail) => signUpCubit.email = inputEmail!,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            validator: validatePassword,
            onSaved: (inputPassword) => signUpCubit.password = inputPassword!,
            hint: 'Password',
            svgIconUrl: 'lib/assets/icons/password-icon.svg',
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
