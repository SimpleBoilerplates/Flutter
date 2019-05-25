import 'package:rxdart/rxdart.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthApiProvider.dart';

class AuthBloc {
  final _repository = AuthRepository();
  final _authFetcher = PublishSubject<Map<String, dynamic>>();

  Observable<Map<String, dynamic>> get signedIn => _authFetcher.stream;
  Observable<Map<String, dynamic>> get signedUp => _authFetcher.stream;

  signIn(String email, String password) async {
    dynamic response = await _repository.signIn(email, password);
    if (!response['error']) {
      _authFetcher.sink.add(response);
    }
  }

  signUp(String email, String password, String name) async {
    dynamic response = await _repository.signUp(email, password, name);
    if (!response['error']) {
      _authFetcher.sink.add(response);
    }
  }

  dispose() {
    _authFetcher.close();
  }
}

final bloc = AuthBloc();
