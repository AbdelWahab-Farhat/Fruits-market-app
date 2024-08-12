import 'package:fresh_fruits/features/auth/presentation/views/sign_in_view.dart';
import 'package:fresh_fruits/features/auth/presentation/views/sign_up_view.dart';
import 'package:fresh_fruits/features/cart/presentation/views/cart_view.dart';
import 'package:fresh_fruits/features/categories/presentation/views/categories_view.dart';
import 'package:fresh_fruits/features/categories/presentation/views/category_view.dart';
import 'package:fresh_fruits/features/home/presentation/views/home_view.dart';
import 'package:fresh_fruits/features/item_details/presentation/views/item_details_view.dart';
import 'package:fresh_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fresh_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const String splashViewPath = '/';
  static const String onboardingViewPath = '/onboarding_view';
  static const String signInViewPath = '/sign_in_view';
  static const String signUpViewPath = '/sign_up_view';
  static const String homeView = '/home_view';
  static const String categoriesView = '/categories_view';
  static const String categoryView = '/category_view';
  static const String itemDetailsView = '/item_details_view';
  static const String cartView = '/cart_view';



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
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: categoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: categoryView,
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: itemDetailsView,
        builder: (context, state) => const ItemDetailsView(),
      ),
      GoRoute(
        path: cartView,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
