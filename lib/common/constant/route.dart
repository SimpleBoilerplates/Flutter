import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/home/ui/screen/home_screen.dart';
import '../../feature/landing/landing_page.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.landing:
      return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());
    case Routes.home:
      return MaterialPageRoute<dynamic>(builder: (_) => HomeScreen());
    default:
      return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
