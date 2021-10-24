import 'dart:convert';

import 'package:flutter_boilerplate/feature/auth/model/login_state.dart';
import 'package:flutter_boilerplate/shared/http/api_provider.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/model/token.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_boilerplate/shared/util/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepository {
  LoginRepository({required this.ref}) {
    api = ref.read(apiProvider);
  }

  late ApiProvider api;
  final ProviderRefBase ref;

  Future<LoginState> login(String? email, String? password) async {
    if (!Validator.isValidPassWord(password)) {
      return const LoginState.error(
          AppException.errorWithMessage('Minimum 8 characters required'));
    }
    if (!Validator.isValidEmail(email)) {
      return const LoginState.error(
          AppException.errorWithMessage('Please enter a valid email address'));
    }
    final params = {
      'email': email,
      'password': password,
    };
    final loginResponse = await api.post('login', jsonEncode(params));

    return loginResponse.when(success: (success) async {
      final tokenRepository = ref.read(tokenRepositoryProvider);

      final token = Token.fromJson(success);

      await tokenRepository.saveToken(token);

      return const LoginState.loggedIn();
    }, error: (error) {
      return LoginState.error(error);
    });

    return const LoginState.initial();
  }
}
