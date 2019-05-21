import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/HomePage.dart';
import 'package:flutter_boilerplate/feature/landing/LandingPage.dart';
import 'package:flutter_boilerplate/feature/auth/page/SignInPage.dart';
import 'package:flutter_boilerplate/feature/auth/page/SignUpPage.dart';
import 'package:flutter_boilerplate/shared/constant/routes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      routes: <String, WidgetBuilder>{
        Routes.landing : (_) => new LandingPage(),
        Routes.home : (_) => new HomePage(),
        Routes.signIn : (_) => new SignInPage(),
        Routes.signUp : (_) => new SignUpPage(),

      },
      //home: LandingPage(),
    );
  }
}

