import 'package:flutter_boilerplate/shared/base/DataState.dart';
import 'package:rxdart/rxdart.dart';

import '../model/Book.dart';
import '../resource/HomeApiProvider.dart';

class HomeBloc {
  final _repository = HomeRepository();

  final _books = PublishSubject<DataState>();

  Stream<DataState> get books => _books.stream;

  void fetchAllBooks() async {
    _books.sink.add(StateLoading());
    final Map response = await _repository.getBooks();
    if (!response['error']) {
      final List<Book> books = (response['data'] as List)?.map((e) {
        return e == null ? null : Book.fromJson(e as Map<String, dynamic>);
      })?.toList();

      _books.sink.add(StateSuccessWithList(books));
    } else {
      _books.sink.add(StateError(response['message']));
    }
  }

  void dispose() {
    _books.close();
  }
}
