import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/HomePage.dart';
import 'package:flutter_boilerplate/feature/landing/LandingPage.dart';
import 'package:flutter_boilerplate/feature/auth/ui/SignInPage.dart';
import 'package:flutter_boilerplate/feature/auth/ui/SignUpPage.dart';

class Routes {
  static const landing = '/';
  static const home = '/home';
  static const signIn = '/signIn';
  static const signUp = '/signUp';

  final route = <String, WidgetBuilder>{
    Routes.landing: (_) => new LandingPage(),
    Routes.home: (_) => new HomePage(),
    Routes.signIn: (_) => new SignInPage(),
    Routes.signUp: (_) => new SignUpPage(),
  };
}
