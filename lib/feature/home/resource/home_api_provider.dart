import 'dart:async';

import 'package:flutter_boilerplate/common/constant/K.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:meta/meta.dart';

class HomeApiProvider {
  HomeApiProvider({@required this.apiProvider}) : assert(apiProvider != null);

  final ApiProvider apiProvider;

  final String _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> fetchBooks()  {
    return apiProvider.get('$_baseUrl/books');
  }
}
