import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/bloc/simple_bloc_delegate.dart';
import 'package:flutter_boilerplate/feature/authentication/blocs/blocs.dart';
import 'package:flutter_boilerplate/feature/authentication/resource/user_repository.dart';
import 'package:flutter_boilerplate/main/app.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context))
                ..add(AppStarted());
            },
          ),
        ],
        child: App(),
      )));
}
