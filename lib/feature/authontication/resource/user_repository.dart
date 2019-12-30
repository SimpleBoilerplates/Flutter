import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const String _token = 'token';

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool saved = false;
    try {
      prefs.remove(_token);
      saved = true;
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return saved;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool saved = false;
    try {
      prefs.setString(_token, token);
      saved = true;
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return saved;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = false;
    try {
      final String token = prefs.getString(_token);
      if (token != null) {
        loggedIn = true;
        return loggedIn;
      }
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return Future<bool>.value(loggedIn);
  }

  Future<String> accessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    try {
      token = prefs.getString(_token);
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return token;
  }
}
