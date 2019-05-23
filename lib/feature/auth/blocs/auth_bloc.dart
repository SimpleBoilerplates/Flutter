import 'package:rxdart/rxdart.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthApiProvider.dart';

class AuthBloc {
  final _repository = AuthRepository();
  final _authFetcher = PublishSubject<Map<String, dynamic>>();

  Observable<Map<String, dynamic>> get signedIn => _authFetcher.stream;

  signIn(String email, String password) async {
    Map<String, dynamic> itemModel = await _repository.signIn(email, password);
    _authFetcher.sink.add(itemModel);
  }

  dispose() {
    _authFetcher.close();
  }
}

final bloc = AuthBloc();
