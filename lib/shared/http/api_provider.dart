import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/shared/http/api_response.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/http/interceptor/dio_connectivity_request_retrier.dart';
import 'package:flutter_boilerplate/shared/http/interceptor/retry_interceptor.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum ContentType { urlEncoded, json }

final apiProvider = Provider<ApiProvider>(
  (ref) => ApiProvider(ref),
);

class ApiProvider {
  ApiProvider(this._ref) {
    _dio = Dio();
    _dio.options.sendTimeout = 30000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    _dio.httpClientAdapter = DefaultHttpClientAdapter();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    if (dotenv.env['BASE_URL'] != null) {
      _baseUrl = dotenv.env['BASE_URL']!;
    }
  }

  final Ref _ref;

  late Dio _dio;

  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);

  late String _baseUrl;

  Future<APIResponse> post(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };
      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken}';
      }
      //Sometime for some specific endpoint it may require to use different Token
      if (token != null) {
        headers['Authorization'] = 'Bearer ${token}';
      }

      final response = await _dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(AppException.errorWithMessage(
                response.data['message'] as String ?? ''));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(AppException.errorWithMessage(
              e.response!.data['message'] as String));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      return APIResponse.error(
          AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> get(
    String path, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = await _tokenRepository.fetchToken();
    if (_appToken != null) {
      headers['Authorization'] = 'Bearer ${_appToken}';
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );
      if (response == null) {
        return const APIResponse.error(AppException.error());
      }
      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data['data']);
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(AppException.connectivity());
        } else if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['error'] != null) {
            return APIResponse.error(AppException.errorWithMessage(
                response.data['error'] as String ?? ''));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }
      return const APIResponse.error(AppException.error());
    }
  }
}
