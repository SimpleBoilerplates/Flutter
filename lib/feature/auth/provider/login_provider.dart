import 'package:flutter_boilerplate/feature/auth/model/login_state.dart';
import 'package:flutter_boilerplate/feature/auth/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  return LoginProvider(ref);
});

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider(this.ref) : super(const LoginState.initial()) {
    _loginRepository = LoginRepository(ref: ref);
  }

  final ProviderRefBase ref;
  late LoginRepository _loginRepository;

  Future<void> login(String email, String password) async {
    //state = const LoginState.loading();
    state = await _loginRepository.login(email, password);
  }
}
