import 'package:fresh_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fresh_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const String splashViewPath = '/';
  static const String onboardingViewPath = '/onboarding_view';

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
    ],
  );
}
