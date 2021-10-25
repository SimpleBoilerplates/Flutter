import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider(ref.read);
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(this._reader) : super(const AuthState.initial()) {}

  final Reader _reader;
  late final AuthRepository _loginRepository = _reader(authRepositoryProvider);

  Future<void> login(String email, String password) async {
    state = await _loginRepository.login(email, password);
  }

  Future<void> signUp(String name, String email, String password) async {
    state = await _loginRepository.signUp(name, email, password);
  }
}
