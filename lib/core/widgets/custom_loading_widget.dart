import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
          child: LoadingAnimationWidget.threeArchedCircle(
        color: kOrange,
        size: 60,
      )),
    );
  }
}
