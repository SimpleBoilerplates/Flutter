import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'package:flutter_boilerplate/shared/http/HttpClient.dart';

class AuthApiProvider {
  final String _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final String data = json.encode({'email': email, 'password': password});
      return HttpClient.post('$_baseUrl/login', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) async {
    try {
      final String data =
          json.encode({'name': name, 'email': email, 'password': password});
      return HttpClient.post('$_baseUrl/signup', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }
}

class AuthRepository {
  final AuthApiProvider authApiProvider = AuthApiProvider();

  Future<Map<String, dynamic>> signIn(String email, String password) =>
      authApiProvider.signIn(email, password);

  Future<Map<String, dynamic>> signUp(
          String email, String password, String name) =>
      authApiProvider.signUp(email, password, name);
}
