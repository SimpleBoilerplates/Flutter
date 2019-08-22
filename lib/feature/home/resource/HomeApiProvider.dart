import 'dart:async';

import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'package:flutter_boilerplate/shared/http/HttpClient.dart';

class HomeApiProvider {
  final String _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> getBooks() async {
    return HttpClient.get('$_baseUrl/books');
  }
}

class HomeRepository {
  final HomeApiProvider homeApiProvider = HomeApiProvider();

  Future<Map<String, dynamic>> getBooks() => homeApiProvider.getBooks();
}
