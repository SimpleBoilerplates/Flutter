import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/route/route_generator.dart';
import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/feature/authentication/resource/user_repository.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <
          LocalizationsDelegate<WidgetsLocalizations>>[
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: const Locale('en', '')),
      localeListResolutionCallback:
          S.delegate.listResolution(fallback: const Locale('en', '')),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.landing,
    );
  }
}
