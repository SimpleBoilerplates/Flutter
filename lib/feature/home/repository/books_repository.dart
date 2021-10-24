import 'package:flutter_boilerplate/feature/home/model/book.dart';
import 'package:flutter_boilerplate/feature/home/state/books_state.dart';
import 'package:flutter_boilerplate/shared/http/api_provider.dart';
import 'package:flutter_boilerplate/shared/http/api_response.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksRepositoryProvider = Provider((ref) => BooksRepository(ref: ref));

class BooksRepository {
  BooksRepository({required this.ref}) {
    api = ref.read(apiProvider);
  }

  late ApiProvider api;
  final ProviderRefBase ref;

  Future<BooksState> fetchBooks() async {
    final response = await api.get('books');

    response.when(
        success: (success) {},
        error: (error) {
          return BooksState.error(error);
        });

    if (response is APISuccess) {
      final value = response.value;
      try {
        final List<Book> _books = booksFromJson(value);
        return BooksState.booksLoaded(_books);
      } catch (e) {
        return BooksState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return BooksState.error(response.exception);
    } else {
      return const BooksState.loading();
    }
  }
}
