import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenmusk_test/views/authentication/base_onboarding_screen.dart';

import 'core/constants/app_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// We added screenutil package for making application
    /// pixel perfect
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      builder: (context, child) {
        return MaterialApp(
          title: 'Greenmusk Flutter Test',
          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData(
            scaffoldBackgroundColor: white,
          ),
        );
      },
      child: BaseOnboardingScreen(),
    );
  }
}
