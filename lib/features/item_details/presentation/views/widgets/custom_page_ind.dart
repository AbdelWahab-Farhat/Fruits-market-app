import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../constants.dart';
class CustomPageInd extends StatelessWidget {
  const CustomPageInd({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: SmoothPageIndicator(
            effect: WormEffect(
                dotHeight: 7,
                dotWidth: 20,
                activeDotColor: kLightWhite,
                dotColor: Colors.white.withOpacity(0.25)
            ),
            controller: controller,
            count: 3,
          ),
        ),
      ),
    );
  }
}
