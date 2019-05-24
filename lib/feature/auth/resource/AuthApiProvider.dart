import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'dart:io';

class AuthApiProvider {
  Client client = Client();
  final _baseUrl = K.baseUrl;

//  final headers = {"Accept": "application/json"};
//  static BaseOptions options = new BaseOptions(
//    baseUrl: K.baseUrl,
//    //connectTimeout: 5000,
//    //receiveTimeout: 3000,
//    contentType: ContentType.parse("application/json")
//  );
//  Dio dio = new Dio(options);

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final data = jsonEncode({"email": email, "password": password});

      // final response = await dio.post("/login", data: data);
      var response = await client.post(
        '$_baseUrl/login',
        headers: {"Accept": "application/json"},
        body: json.encode(data),
      );

      print("sign called " + response.body);
      return jsonDecode(response.body);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

//     if(e.error) {
//       print(e.response.data);
//       print(e.response.headers);
//       print(e.response.request);
//     } else{
//       // Something happened in setting up or sending the request that triggered an Error
//       print(e.request);
//       print(e.message);
//     }
      throw Exception('Failed to load post ' + e.message);
    }
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) async {
    try {
      final data =
          jsonEncode({"email": email, "password": password, "name": name});

      // final response = await dio.post("/login", data: data);
      var response = await client.post(
        '$_baseUrl/signUp',
        headers: {"Accept": "application/json"},
        body: json.encode(data),
      );

      print("sign called " + response.body);
      return jsonDecode(response.body);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

//     if(e.error) {
//       print(e.response.data);
//       print(e.response.headers);
//       print(e.response.request);
//     } else{
//       // Something happened in setting up or sending the request that triggered an Error
//       print(e.request);
//       print(e.message);
//     }
      throw Exception('Failed to load post ' + e.message);
    }
  }
}

class AuthRepository {
  final authApiProvider = AuthApiProvider();
  Future<Map<String, dynamic>> signIn(String email, String password) =>
      authApiProvider.signIn(email, password);

  Future<Map<String, dynamic>> signUp(
          String email, String password, String name) =>
      authApiProvider.signUp(email, password, name);
}
