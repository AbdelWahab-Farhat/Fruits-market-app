import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants.dart';
import 'package:fresh_fruits/core/firebase/firestore_service.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/core/widgets/custom_loading_widget.dart';
import 'package:fresh_fruits/features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:fresh_fruits/features/root/root.dart';
import 'sign_in_section.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        if (authSnapshot.hasData) {
          return FutureBuilder(
            future: FireStoreService.fetchUserInfo(authSnapshot.data!.uid),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body:  CustomLoadingWidget());
              }
              if (userSnapshot.hasError) {
                return const Center(child: Text('Error fetching user data'));
              }
              if (userSnapshot.hasData && userSnapshot.data != null) {
                final customer = userSnapshot.data!;
                final signInCubit = context.read<SignInCubit>();
                if (signInCubit.customer == null) {
                  signInCubit.setCustomer(customer); // Better to use a method within the Cubit to set customer
                }
                return const Root();
              }

              return const Center(child: Text('User data not found'));
            },
          );
        }

        // Show sign-in screen if the user is not authenticated
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
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: const SignInSection(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
