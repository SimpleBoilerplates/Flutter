import 'dart:async';
import 'package:flutter_boilerplate/shared/constant/K.dart';
import 'package:flutter_boilerplate/shared/http/HttpHelper.dart';

class HomeApiProvider {
  final _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> getBooks() async {
    return HttpHelper.get('$_baseUrl/books');
  }
}

class HomeRepository {
  final homeApiProvider = HomeApiProvider();
  Future<Map<String, dynamic>> getBooks() => homeApiProvider.getBooks();
}
