import 'dart:async';

import 'package:flutter_boilerplate/common/constant/K.dart';
import 'package:flutter_boilerplate/common/http/http_client.dart';

class HomeApiProvider {
  final String _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> getBooks() async {
    return HttpClient.get('$_baseUrl/books');
  }
}
