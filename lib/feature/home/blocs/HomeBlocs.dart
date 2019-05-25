import 'package:rxdart/rxdart.dart';
import '../model/Book.dart';
import '../resource/HomeApiProvider.dart';

class HomeBloc {
  final _repository = HomeRepository();
  final _booksFetcher = PublishSubject<List<Book>>();

  Observable<List<Book>> get allBooks => _booksFetcher.stream;

  fetchAllBooks() async {
    final response = await _repository.getBooks();
    var books;
    if (!response['error']) {
      books = (response['data'] as List)
          ?.map((e) =>
              e == null ? null : Book.fromJson(e as Map<String, dynamic>))
          ?.toList();
    } else {
      books = List<Book>();
    }
    _booksFetcher.sink.add(books);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bloc = HomeBloc();
