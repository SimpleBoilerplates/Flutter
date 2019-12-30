import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  static Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ''}) async {
    return await http.post(Uri.encodeFull(url), body: body, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }).then((http.Response response) {
      //      print(response.body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception('Error while fetching data');
      }
      return json.decode(response.body);
    });
  }

  static Future<Map<String, dynamic>> get(String url,
      {String token = '', dynamic query}) async {
    print('token ' + token);
    return await http.get(Uri.encodeFull(url), headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception('Error while fetching data');
      }
      return json.decode(response.body);
    });
  }
}
