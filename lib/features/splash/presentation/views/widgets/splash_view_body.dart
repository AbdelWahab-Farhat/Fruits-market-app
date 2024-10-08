import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/helper.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () async {
      final  sp = await SharedPreferences.getInstance();
      var connectivityResult = await Connectivity().checkConnectivity();
      if (!connectivityResult.contains(ConnectivityResult.none)) {
        if (sp.containsKey('firstTime')) {
          _navigateToSignIn();
        }
        else {
          sp.setBool('firstTime', true);
          _navigateToOnboarding();
        }
      } else {
        showTopSnackBar(context, 'No Internet Connection',durationSeconds: 5);
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/logo-icon.svg',
            ),
            const SizedBox(height: 50),
            SlideTransition(
              position: _animation,
              child: Text(
                'Fresh Fruits',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: kLightGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToSignIn() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GoRouter.of(context).go(AppRouter.signInViewPath);
    });
  }
  void _navigateToOnboarding() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GoRouter.of(context).pushReplacement(AppRouter.onboardingViewPath);
    });
  }

  void initAnimation() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
}
