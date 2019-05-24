import 'package:rxdart/rxdart.dart';
import '../model/Book.dart';
import '../resource/HomeApiProvider.dart';

class HomeBloc {
  final _repository = HomeRepository();
  final _booksFetcher = PublishSubject<List<Book>>();

  Observable<List<Book>> get allMovies => _booksFetcher.stream;

  fetchAllBooks() async {
    final books = await _repository.getBooks();
    _booksFetcher.sink.add(books);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bloc = HomeBloc();
