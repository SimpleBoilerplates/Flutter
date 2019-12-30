import 'home_api_provider.dart';

class HomeRepository {
  final HomeApiProvider homeApiProvider = HomeApiProvider();

  Future<Map<String, dynamic>> getBooks() => homeApiProvider.getBooks();
}
