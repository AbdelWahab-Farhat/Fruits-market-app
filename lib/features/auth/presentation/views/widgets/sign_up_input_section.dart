import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomTextFormField(hint: 'First Name')),
            SizedBox(
              width: 19,
            ),
            Expanded(child: CustomTextFormField(hint: 'Last Name')),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        CustomTextFormField(hint: 'Email'),
        SizedBox(
          height: 12,
        ),
        CustomTextFormField(
          hint: 'Password',
          svgIconUrl: 'lib/assets/icons/password-icon.svg',
          isPassword: true,
        ),
      ],
    );
  }
}
