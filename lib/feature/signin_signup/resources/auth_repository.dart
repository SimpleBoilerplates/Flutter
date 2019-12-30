import 'auth_api_provider.dart';

class AuthRepository {
  final AuthApiProvider authApiProvider = AuthApiProvider();

  Future<Map<String, dynamic>> signIn(String email, String password) =>
      authApiProvider.signIn(email, password);

  Future<Map<String, dynamic>> signUp(
          String email, String password, String name) =>
      authApiProvider.signUp(email, password, name);
}
