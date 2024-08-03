import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/utility/app_router.dart';
import 'package:fresh_fruits/core/utility/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSizeConfig(context);
    return  MaterialApp.router(
      theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter,
    );
  }
}
