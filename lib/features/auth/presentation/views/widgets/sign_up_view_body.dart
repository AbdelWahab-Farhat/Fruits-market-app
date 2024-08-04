import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'sign_up_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.viewWidth,
        height: SizeConfig.viewHeight,
        child: Stack(
          children: [
            Image.asset('lib/assets/images/sign-in-1.png'),
            Positioned(
              bottom: 0,
              child: Container(
                width: SizeConfig.viewWidth,
                height: SizeConfig.viewHeight! * 0.55,
                decoration: const BoxDecoration(
                  color: kLightWhite,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                ),
                child: const SignUpSection(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


