import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/core/apis/world_time_api.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:fresh_fruits/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fresh_fruits/features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  await WorldTimeApi().fetchWorldTime();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSizeConfig(context);
    return BlocProvider(
      create: (context) => SignInCubit(AuthRepoImpl()),
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffFAFEFC),
            fontFamily: GoogleFonts
                .inter()
                .fontFamily),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.appRouter,
      ),
    );
  }
}