import 'package:rxdart/rxdart.dart';

import '../resource/AuthApiProvider.dart';

class AuthBloc {
  final _repository = AuthRepository();

  final _signedIn = PublishSubject<Map<String, dynamic>>();
  final _signedUp = PublishSubject<Map<String, dynamic>>();
  final _showProgress = BehaviorSubject<bool>();

  Observable<Map<String, dynamic>> get signedIn => _signedIn.stream;

  Observable<Map<String, dynamic>> get signedUp => _signedUp.stream;

  Observable<bool> get showProgress => _showProgress.stream;

  void signIn(String email, String password) async {
    _showProgress.sink.add(true);

    final response = await _repository.signIn(email, password);
    if (!response['error']) {
      _showProgress.sink.add(false);
      _signedIn.sink.add(response);
    }
  }

  void signUp(String email, String password, String name) async {
    _showProgress.sink.add(true);
    final response = await _repository.signUp(email, password, name);
    if (!response['error']) {
      _showProgress.sink.add(false);
      _signedUp.sink.add(response);
    }
  }

  void dispose() async {
    _signedIn.close();
    _signedUp.close();
    //await _showProgress.drain();
    _showProgress.close();
  }
}

//final bloc  = AuthBloc();
