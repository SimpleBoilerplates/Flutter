import 'dart:async';

import 'package:flutter_boilerplate/shared/base/DataState.dart';
import 'package:rxdart/rxdart.dart';

import '../../../shared/util/FormValidator.dart';
import '../resource/AuthApiProvider.dart';
import '../resource/AuthHelper.dart';

class AuthBloc {
  final _repository = AuthRepository();

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();

  final _signedIn = PublishSubject<DataState>();
  final _signedUp = PublishSubject<DataState>();

  Observable<DataState> get signedIn => _signedIn.stream;

  Observable<DataState> get signedUp => _signedUp.stream;

  Observable<String> get email => _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<String> get name => _password.stream.transform(_validateName);

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeName => _name.sink.add;

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (FormValidator.validateEmail(email)) {
      sink.add(email);
    } else {
      // sink.addError(StringConstant.emailValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (FormValidator.validatePassword(password)) {
      sink.add(password);
    } else {
      // sink.addError(StringConstant.passwordValidateMessage);
    }
  });

  final _validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length > 3) {
      sink.add(name);
    } else {
      // sink.addError(StringConstant.passwordValidateMessage);
    }
  });

  void signIn() async {
    _signedIn.sink.add(StateLoading());

    final response = await _repository.signIn(_email.value, _password.value);

    if (!response['error']) {
      AuthHelper.setAccessToken(response['token']);
      _signedIn.sink.add(StateSuccessWithMap(response));
    }
  }

  void signUp() async {
    _signedUp.sink.add(StateLoading());
    final response =
        await _repository.signUp(_email.value, _password.value, _name.value);
    if (!response['error']) {
      AuthHelper.setAccessToken(response['token']);
      _signedUp.sink.add(StateSuccessWithMap(response));
    }
  }

  void dispose() async {
    _signedIn.close();
    _signedUp.close();
  }
}
