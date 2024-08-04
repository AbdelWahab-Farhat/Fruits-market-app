import 'package:fresh_fruits/features/auth/presentation/views/sign_in_view.dart';
import 'package:fresh_fruits/features/auth/presentation/views/sign_up_view.dart';
import 'package:fresh_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fresh_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const String splashViewPath = '/';
  static const String onboardingViewPath = '/onboarding_view';
  static const String signInViewPath = '/sign_in_view';
  static const String signUpViewPath = '/sign_up_view';

  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: splashViewPath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboardingViewPath,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: signInViewPath,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: signUpViewPath,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
