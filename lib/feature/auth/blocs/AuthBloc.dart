import 'package:rxdart/rxdart.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthApiProvider.dart';

class AuthBloc {
  final _repository = AuthRepository();
  final _authFetcher = PublishSubject<Map<String, dynamic>>();

  Observable<Map<String, dynamic>> get signedIn => _authFetcher.stream;
  Observable<Map<String, dynamic>> get signedUp => _authFetcher.stream;

  void signIn(String email, String password) async {
    final response = await _repository.signIn(email, password);
    if (!response['error']) {
      _authFetcher.sink.add(response);
    }
  }

  void signUp(String email, String password, String name) async {
    final response = await _repository.signUp(email, password, name);
    if (!response['error']) {
      _authFetcher.sink.add(response);
    }
  }

  void dispose() {
    _authFetcher.close();
  }
}

final bloc  = AuthBloc();
