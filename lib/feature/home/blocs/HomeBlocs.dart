import 'package:rxdart/rxdart.dart';
import '../model/Book.dart';
import '../resource/HomeApiProvider.dart';

class HomeBloc {
  final _repository = HomeRepository();
  final _booksFetcher = PublishSubject<List<Book>>();

  Observable<List<Book>> get allBooks => _booksFetcher.stream;

  void fetchAllBooks() async {
    final response = await _repository.getBooks();
    if (!response['error']) {
      var books = (response['data'] as List)
          ?.map((e) =>
              e == null ? null : Book.fromJson(e as Map<String, dynamic>))
          ?.toList();
      _booksFetcher.sink.add(books);
    } else {}
  }

 void dispose() {
    _booksFetcher.close();
  }
}

