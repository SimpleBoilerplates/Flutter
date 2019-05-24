import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'dart:io';
import '../model/Book.dart';

class HomeApiProvider {
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

  Future<List<Book>> getBooks() async {
    try {
      var response = await client
          .get('$_baseUrl/books', headers: {"Accept": "application/json"});

      final jsonValue = jsonDecode(response.body);
      if (!jsonValue['error']) {
        return (jsonValue['data'] as List)
            ?.map((e) =>
                e == null ? null : Book.fromJson(e as Map<String, dynamic>))
            ?.toList();
      } else {
        return List<Book>();
      }
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

class HomeRepository {
  final homeApiProvider = HomeApiProvider();
  Future<List<Book>> getBooks() => homeApiProvider.getBooks();
}
