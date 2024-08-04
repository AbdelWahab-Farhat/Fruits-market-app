import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/core/widgets/custom_filled_button.dart';
import 'package:fresh_fruits/features/onboarding/presentation/views/widgets/custom_page_view.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_page_view_item.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final List<Widget> items = const [
    CustomPageViewItem(
      imageURL: 'lib/assets/images/on-borading-1.png',
      title: 'Welcome to Fresh Fruits',
      subTitle: 'Your one-stop shop for the freshest fruits.',
    ),
    CustomPageViewItem(
      imageURL: 'lib/assets/images/on-borading-2.png',
      title: 'We provide best quality Fruits to your family',
      subTitle: 'Freshness and taste delivered right to your doorstep.',
    )
  ];
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.viewWidth,
              height: SizeConfig.viewHeight! * 0.7,
              child:
                  CustomPageView(pageController: pageController, items: items),
            ),
            const SizedBox(
              height: 70,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: items.length,
              effect: const WormEffect(
                  dotHeight: 5, dotWidth: 23, activeDotColor: G0),
            ),
            const Expanded(
              child: SizedBox(
                width: 20,
                          ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: CustomFilledButton(
                title: 'Next',
                onTap: ()=> pageButtonAction(context),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  void pageButtonAction(BuildContext context) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear);
    if (pageController.page == items.length - 1) {
      GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
    }
  }
}
