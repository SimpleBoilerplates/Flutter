import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:meta/meta.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final response = await authRepository.signUp(
            event.email, event.username, event.password);
        if (!response['error']) {
          yield SignUpSuccess();
          //authenticationBloc.add(LoggedIn(token: response["token"]));
        } else {
          yield SignUpInitial();
        }
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
