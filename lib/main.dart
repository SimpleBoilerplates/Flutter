import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

import 'main/bloc/GlobalBlocProvider.dart';
import 'shared/constant/Routes.dart';

void main() {
  //FluroRouter.setupRouter();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp(
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
        routes: Routes().route,
      ),
    );
  }
}
