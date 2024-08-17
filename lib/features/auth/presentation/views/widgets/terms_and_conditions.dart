import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
