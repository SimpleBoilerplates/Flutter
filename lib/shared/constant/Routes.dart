import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/BookDetail.dart';

import 'package:flutter_boilerplate/feature/home/ui/HomePage.dart';
import 'package:flutter_boilerplate/feature/landing/LandingPage.dart';
import 'package:flutter_boilerplate/feature/auth/ui/SignInPage.dart';
import 'package:flutter_boilerplate/feature/auth/ui/SignUpPage.dart';
//import 'package:fluro/fluro.dart';

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


// ignore: avoid_classes_with_only_static_members
//class FluroRouter {
//  static Handler _bookDetailHandler = Handler(
//      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//          BookDetail());
//
//  static Handler _homeHandler = Handler(
//      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//          HomePage());
//
//  static Router router = Router();
//  static void setupRouter() {
//    router.define("/", handler: _homeHandler);
//    router.define("bookDetail", handler: _bookDetailHandler);
//
//  }
//}

