import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:meta/meta.dart';

import 'auth_api_provider.dart';

class AuthRepository {
  final ApiProvider apiProvider;
  AuthApiProvider authApiProvider;
  InternetCheck internetCheck;

  AuthRepository({@required this.apiProvider, @required this.internetCheck}) {
    authApiProvider = AuthApiProvider(apiProvider: apiProvider);
  }

  Future<Map<String, dynamic>> signIn(String email, String password) {
    return authApiProvider.signIn(email, password);
  }
  Future<Map<String, dynamic>> signUp(
          String email, String password, String name) {
    return authApiProvider.signUp(email, password, name);
  }
}
