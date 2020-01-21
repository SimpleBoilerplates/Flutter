import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_boilerplate/common/constant/K.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';

class HomeApiProvider {

  HomeApiProvider({@required this.apiProvider}) : assert(apiProvider != null);

  ApiProvider apiProvider;


  final String _baseUrl = K.baseUrl;

  Future<Map<String, dynamic>> fetchBooks() async {
    return apiProvider.get('$_baseUrl/books');
  }
}
