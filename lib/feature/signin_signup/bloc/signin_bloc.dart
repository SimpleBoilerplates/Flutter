import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/common/http/response.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoading();

      try {
        final response =
            await authRepository.signIn(event.username, event.password);
        if (response.status == Status.ConnectivityError) {
          //Internet problem
          yield const SignInFailure(error: "");
        }
        if (response.status == Status.Success) {
          authenticationBloc.add(LoggedIn(token: response.data));
          yield SignInSuccess();
        } else {
          yield SignInFailure(error: response.message);
        }
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}
