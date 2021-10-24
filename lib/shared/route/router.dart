// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/widget/app_start_page.dart';
import 'package:flutter_boilerplate/feature/auth/widget/routes.dart';
import 'package:flutter_boilerplate/feature/home/widget/routes.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute(page: AppStartPage, initial: true),
    homeRouter,
    signInRouter,
    signUpRouter
  ],
)
class $AppRouter {}
