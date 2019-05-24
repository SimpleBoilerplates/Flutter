import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static final String _token = "token";

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var loggedIn = false;

    try {
      var token = prefs.getString(_token);
      if (token != null) {
        loggedIn = true;
        return loggedIn;
      }
    } on Exception catch (e) {
      print("custom exception is been obtained");
    }

    return Future<bool>.value(loggedIn);
  }

  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "";

    try {
      token = prefs.getString(_token);
    } on Exception catch (e) {
      print("custom exception is been obtained");
    }

    return token;
  }

  static Future<bool> setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var saved = false;

    try {
      prefs.setString(_token, token);
      saved = true;
    } on Exception catch (e) {
      print("custom exception is been obtained");
    }

    return saved;
  }

  static Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var saved = false;

    try {
      prefs.remove(_token);
      saved = true;
    } on Exception catch (e) {
      print("custom exception is been obtained");
    }
    return saved;
  }
}
