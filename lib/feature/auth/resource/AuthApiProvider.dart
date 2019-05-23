import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:flutter_boilerplate/shared/constant/K.dart';

class AuthApiProvider {
  Client client = Client();
  final _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await client.get("$_baseUrl/login");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class AuthRepository {
  final authApiProvider = AuthApiProvider();

  Future<Map<String, dynamic>> signIn(String email, String password) =>
      authApiProvider.signIn(email, password);

  //Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
