import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/common/bloc/connectivity/index.dart';
import 'package:flutter_boilerplate/common/bloc/simple_bloc_delegate.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/authentication/resource/user_repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiRepositoryProvider(
      providers: [

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
        child: App(),
      )));
}
