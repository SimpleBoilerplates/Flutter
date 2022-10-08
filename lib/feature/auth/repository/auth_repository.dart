import 'dart:convert';

import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/shared/http/api_provider.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/model/token.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_boilerplate/shared/util/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepositoryProtocol {
  Future<AuthState> login(String email, String password);
  Future<AuthState> signUp(String name, String email, String password);
}

final authRepositoryProvider = Provider((ref) => AuthRepository(ref));

class AuthRepository implements AuthRepositoryProtocol {
  AuthRepository(this._ref) {}

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AuthState> login(String email, String password) async {
    if (!Validator.isValidPassWord(password)) {
      return const AuthState.error(
          AppException.errorWithMessage('Minimum 8 characters required'));
    }
    if (!Validator.isValidEmail(email)) {
      return const AuthState.error(
          AppException.errorWithMessage('Please enter a valid email address'));
    }
    final params = {
      'email': email,
      'password': password,
    };
    final loginResponse = await _api.post('login', jsonEncode(params));

    return loginResponse.when(success: (success) async {
      final tokenRepository = _ref.read(tokenRepositoryProvider);

      final token = Token.fromJson(success as Map<String, dynamic>);

      await tokenRepository.saveToken(token);

      return const AuthState.loggedIn();
    }, error: (error) {
      return AuthState.error(error);
    });
  }

  @override
  Future<AuthState> signUp(String name, String email, String password) async {
    if (!Validator.isValidPassWord(password)) {
      return const AuthState.error(
        AppException.errorWithMessage('Minimum 8 characters required'),
      );
    }
    if (!Validator.isValidEmail(email)) {
      return const AuthState.error(
        AppException.errorWithMessage('Please enter a valid email address'),
      );
    }
    final params = {
      'name': name,
      'email': email,
      'password': password,
    };
    final loginResponse = await _api.post('sign_up', jsonEncode(params));

    return loginResponse.when(success: (success) async {
      final tokenRepository = _ref.read(tokenRepositoryProvider);

      final token = Token.fromJson(success as Map<String, dynamic>);

      await tokenRepository.saveToken(token);

      return const AuthState.loggedIn();
    }, error: (error) {
      return AuthState.error(error);
    });
  }
}
