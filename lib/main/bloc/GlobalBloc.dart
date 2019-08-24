import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  final _isAuthonticated = BehaviorSubject<bool>();

  Observable<bool> get isAuthonticated => _isAuthonticated.stream;

  void handleAuth() {
    AuthHelper.isLoggedIn().then((onValue) {
      _isAuthonticated.sink.add(onValue);
    });
  }

  void logout() {
    AuthHelper.logout().then((onValue) {
      if (onValue) {
        _isAuthonticated.sink.add(onValue);
      }
    });
  }

  void dispose() {}
}
