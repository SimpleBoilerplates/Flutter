import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider(ref);
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(this.ref) : super(const AuthState.initial()) {
    _loginRepository = AuthRepository(ref: ref);
  }

  final ProviderRefBase ref;
  late AuthRepository _loginRepository;

  Future<void> login(String email, String password) async {
    //state = const LoginState.loading();
    state = await _loginRepository.login(email, password);
  }

  Future<void> signUp(String name, String email, String password) async {
    //state = const LoginState.loading();
    state = await _loginRepository.signUp(name, email, password);
  }
}
