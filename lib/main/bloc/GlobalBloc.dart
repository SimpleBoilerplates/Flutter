import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  final _isAuthenticated = BehaviorSubject<bool>();

  Stream<bool> get isAuthenticated => _isAuthenticated.stream;

  void handleAuth() {
    AuthHelper.isLoggedIn().then((bool onValue) {
      _isAuthenticated.sink.add(onValue);
    });
  }

  void logout() {
    AuthHelper.logout().then((bool onValue) {
      if (onValue) {
        _isAuthenticated.sink.add(onValue);
      }
    });
  }

  void dispose() {}
}
