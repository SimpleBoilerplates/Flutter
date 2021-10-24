// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_boilerplate/app/widget/app_start_widget.dart' as _i1;
import 'package:flutter_boilerplate/feature/home/widget/home_widget.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppStartWidget.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.AppStartWidget());
    },
    HomeWidget.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeWidget());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(AppStartWidget.name, path: '/'),
        _i3.RouteConfig(HomeWidget.name, path: '/home-widget')
      ];
}

/// generated route for [_i1.AppStartWidget]
class AppStartWidget extends _i3.PageRouteInfo<void> {
  const AppStartWidget() : super(name, path: '/');

  static const String name = 'AppStartWidget';
}

/// generated route for [_i2.HomeWidget]
class HomeWidget extends _i3.PageRouteInfo<void> {
  const HomeWidget() : super(name, path: '/home-widget');

  static const String name = 'HomeWidget';
}
