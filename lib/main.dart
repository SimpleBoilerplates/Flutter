import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/constant/route.dart' as route;
import 'package:flutter_boilerplate/common/constant/routes.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

import 'feature/authontication/blocs/blocs.dart';
import 'feature/authontication/resource/user_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

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
      onGenerateRoute: route.generateRoute,
      initialRoute: Routes.landing,
    );
  }
}

//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GlobalBlocProvider(
//      child: MaterialApp(
//        localizationsDelegates: const <
//            LocalizationsDelegate<WidgetsLocalizations>>[
//          S.delegate,
//        ],
//        supportedLocales: S.delegate.supportedLocales,
//        localeResolutionCallback:
//            S.delegate.resolution(fallback: const Locale('en', '')),
//        localeListResolutionCallback:
//            S.delegate.listResolution(fallback: const Locale('en', '')),
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blueGrey,
//        ),
//        routes: Routes().route,
//      ),
//    );
//  }
//}
