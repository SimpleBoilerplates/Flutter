import 'dart:async';

import 'package:flutter_boilerplate/shared/base/DataState.dart';
import 'package:rxdart/rxdart.dart';

import '../../../shared/util/FormValidator.dart';
import '../resource/AuthApiProvider.dart';
import '../resource/AuthHelper.dart';

class AuthBloc {
  final AuthRepository _repository = AuthRepository();

  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();
  final BehaviorSubject<String> _name = BehaviorSubject<String>();

  final PublishSubject<DataState> _signedIn = PublishSubject<DataState>();
  final PublishSubject<DataState> _signedUp = PublishSubject<DataState>();

  Stream<DataState> get signedIn => _signedIn.stream;

  Stream<DataState> get signedUp => _signedUp.stream;

  Stream<String> get email => _email.stream.transform(_validateEmail);

  Stream<String> get password =>
      _password.stream.transform(_validatePassword);

  Stream<String> get name => _password.stream.transform(_validateName);

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeName => _name.sink.add;

  final StreamTransformer<String, String> _validateEmail =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String email, EventSink<String> sink) {
    if (FormValidator.validateEmail(email)) {
      sink.add(email);
    }
  });

  final StreamTransformer<String, String> _validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String password, EventSink<String> sink) {
    if (FormValidator.validatePassword(password)) {
      sink.add(password);
    }
  });

  final StreamTransformer<String, String> _validateName =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String name, EventSink<String> sink) {
    if (name.length > 3) {
      sink.add(name);
    }
  });

  void signIn() async {
    _signedIn.sink.add(StateLoading());

    final response = await _repository.signIn(_email.value, _password.value);
    print(response);
    if (!response['error']) {
      AuthHelper.setAccessToken(response['token']);
      _signedIn.sink.add(StateSuccessWithMap(response));
    } else {
      _signedIn.sink.add(StateError(response['message']));
    }
  }

  void signUp() async {
    _signedUp.sink.add(StateLoading());
    final response =
        await _repository.signUp(_email.value, _password.value, _name.value);
    if (!response['error']) {
      AuthHelper.setAccessToken(response['token']);
      _signedUp.sink.add(StateSuccessWithMap(response));
    } else {
      _signedIn.sink.add(StateError(response['message']));
    }
  }

  // ignore: avoid_void_async
  void dispose() async {
    _signedIn.close();
    _signedUp.close();
  }
}
