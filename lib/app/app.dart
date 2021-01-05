import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/bloc/connectivity/index.dart';
import 'package:flutter_boilerplate/common/constant/env.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/route/route_generator.dart';
import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/authentication/resource/user_repository.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme.dart';

class App extends StatelessWidget {
  final Env env;

  App({Key key, @required this.env}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Env>(
            create: (context) => env,
            lazy: true,
          ),
          RepositoryProvider<InternetCheck>(
            create: (context) => InternetCheck(),
            lazy: true,
          ),
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(),
            lazy: true,
          ),
          RepositoryProvider<ApiProvider>(
            create: (context) => ApiProvider(),
            lazy: true,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ConnectivityBloc>(
              create: (context) {
                return ConnectivityBloc();
              },
            ),
            BlocProvider<AuthenticationBloc>(
              create: (context) {
                return AuthenticationBloc(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context))
                  ..add(AuthStarted());
              },
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            theme: basicTheme,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.landing,
          ),
        ));
  }
}
