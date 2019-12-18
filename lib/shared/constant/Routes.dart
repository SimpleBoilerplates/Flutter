import 'package:flutter/material.dart';

import '../../feature/auth/ui/screen/SignInScreen.dart';
import '../../feature/auth/ui/screen/SignUpScreen.dart';
import '../../feature/home/ui/screen/HomeScreen.dart';
import '../../feature/landing/LandingPage.dart';

class Routes {
  static const String landing = '/';
  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';

  final Map route = <String, WidgetBuilder>{
    Routes.landing: (_) => const LandingPage(),
    Routes.home: (_) => HomeScreen(),
    Routes.signIn: (_) => const SignInScreen(),
    Routes.signUp: (_) => const SignUpScreen(),
  };
}
