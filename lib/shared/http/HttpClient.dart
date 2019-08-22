import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

//final Authenticator authenticator = new Authenticator();
//
//class Authenticator {
//  static const clientId = 'mobileapp';
//  static const clientSecret = 'secret';
//  static const authority = 'fastpayidsbeta-staging.azurewebsites.net';
//
//  String _token;
//  String _sessionToken;
//
//  final HttpClient _client = new HttpClient();
//
//  String get sessionToken => _sessionToken;
//
//  Future<String> _getToken(String formData) async {
//    var req = await _client.postUrl(new Uri.https(authority, '/connect/token'));
//    req
//      ..headers.contentType = new ContentType(
//          'application', 'x-www-form-urlencoded',
//          charset: 'utf-8')
//      ..write(formData);
//
//    var resp = await req.close();
//
//    Map data = await _parseData(resp);
//    return data["access_token"];
//  }
//
//  Future<Map> _parseData(HttpClientResponse response) async {
//    if (response.statusCode == HttpStatus.NOT_FOUND) {
//      throw 'User does not exist';
//    }
//
//    if (response.statusCode >= 400) {
//      print(response.reasonPhrase);
//      Map error = await _extractJsonObject(response);
//      String errorMessage = error['error'] == 'invalid_grant'
//          ? 'Invalid PIN'
//          : 'Unable to process';
//      throw '$errorMessage';
//    }
//
//    return await _extractJsonObject(response);
//  }
//
//  Future<Object> _extractJsonObject(HttpClientResponse response) =>
//      response.transform(utf8.decoder).transform(json.decoder).first;
//
//  Future<String> getToken({bool useCached: true}) async {
//    if (_token != null && useCached) return _token;
//
//    _token = await _getToken('grant_type=client_credentials&'
//        'client_id=$clientId&'
//        'client_secret=$clientSecret');
//
//    return _token;
//  }
//
//  Future<String> getSessionToken(String userId, String pin, String deviceId,
//      {bool useCached: true}) async {
//    if (_sessionToken != null && useCached) return _sessionToken;
//
//    _sessionToken = await _getToken('grant_type=password&'
//        'client_id=$clientId&'
//        'client_secret=$clientSecret&'
//        'username=$userId&'
//        'password=$pin&'
//        'device_id=$deviceId');
//
//    return _sessionToken;
//  }
//}

class HttpClient {
  // var client = new http.Client();

  static Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ""}) async {
    return await http.post(Uri.encodeFull(url), body: body, headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization": "Bearer " + token
    }).then((http.Response response) {
      //      print(response.body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
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
