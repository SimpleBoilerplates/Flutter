import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/screen/home_page.dart';
import 'package:flutter_boilerplate/feature/landing/landing_page.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/sign_in_page.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/sign_up_page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.signIn:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignInPage(authRepository: args));
        }

        return _errorRoute();

      case Routes.signUp:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignUpPage(authRepository: args));
        }

        return _errorRoute();

      case Routes.home:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Books'),
                ),
                body: HomePage()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
