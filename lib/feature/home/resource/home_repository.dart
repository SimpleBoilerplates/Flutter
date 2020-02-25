import 'package:flutter_boilerplate/common/constant/env.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/http/response.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';
import 'package:meta/meta.dart';

import 'home_api_provider.dart';

class HomeRepository {
  ApiProvider apiProvider;
  HomeApiProvider homeApiProvider;
  InternetCheck internetCheck;
  Env env;

  HomeRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    homeApiProvider =
        HomeApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<DataResponse<List<Book>>> fetchBooks() async {
    final response = await homeApiProvider.fetchBooks();

    if (response == null) {
      return DataResponse.connectivityError();
    }

    if (!response['error']) {
      final List<Book> _books = (response['data'] as List)?.map((dynamic e) {
        return e == null ? null : Book.fromJson(e as Map<String, dynamic>);
      })?.toList();
      return DataResponse.success(_books);
    } else {
      return DataResponse.error("Error");
    }
  }
}
