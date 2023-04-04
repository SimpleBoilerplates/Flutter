// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/widget/app_start_page.dart';
import 'package:flutter_boilerplate/feature/auth/widget/sign_in_page.dart';
import 'package:flutter_boilerplate/feature/auth/widget/sign_up_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  //final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    //refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: AppRoute.path,
    routes: $appRoutes,
    //redirect: notifier.redirect,
  );
}

@TypedGoRoute<AppRoute>(path: AppRoute.path)
class AppRoute extends GoRouteData {
  const AppRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppStartPage();
  }
}

@TypedGoRoute<SignInRoute>(path: SignInRoute.path)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  static const path = '/signIn';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignInPage();
  }
}

@TypedGoRoute<SignUpRoute>(path: SignUpRoute.path)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  static const path = '/signUp';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpPage();
  }
}

class GoNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did push route $route : $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did pop route $route : $previousRoute');
  }
}
