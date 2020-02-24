import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class ApiProvider {
  String token = '';

  void setToken(String token) {
    this.token = token;
  }

  Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ''}) async {
    dynamic responseJson;
    try {
      final dynamic response =
          await http.post(Uri.encodeFull(url), body: body, headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ' + token
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url, {String token = '', dynamic query}) async {
    dynamic responseJson;
    try {
      final dynamic response = await http.get(Uri.encodeFull(url), headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ' + token
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
