import 'package:flutter/material.dart';

import '../../feature/auth/ui/screen/SignInScreen.dart';
import '../../feature/auth/ui/screen/SignUpScreen.dart';
import '../../feature/home/ui/screen/HomeScreen.dart';
import '../../feature/landing/LandingPage.dart';

class Routes {
  static const landing = '/';
  static const home = '/home';
  static const signIn = '/signIn';
  static const signUp = '/signUp';

  final route = <String, WidgetBuilder>{
    Routes.landing: (_) => LandingPage(),
    Routes.home: (_) => HomeScreen(),
    Routes.signIn: (_) => SignInScreen(),
    Routes.signUp: (_) => SignUpScreen(),
  };
}
