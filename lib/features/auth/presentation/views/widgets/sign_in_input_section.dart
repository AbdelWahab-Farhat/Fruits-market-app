import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class SignInInputSection extends StatelessWidget {
  const SignInInputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        CustomTextFormField(hint: 'Email'),
        SizedBox(height: 12,),
        CustomTextFormField(hint: 'Password', svgIconUrl: 'lib/assets/icons/password-icon.svg',isPassword: true,),
      ],
    );
  }
}
