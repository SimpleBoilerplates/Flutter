import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/common/http/response.dart';
import 'package:flutter_boilerplate/feature/home/bloc/index.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';
import 'package:flutter_boilerplate/feature/home/resource/home_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class BooksBloc extends Bloc<BookEvent, BookState> {
  final HomeRepository homeRepository;

  BooksBloc({@required this.homeRepository})
      : assert(homeRepository != null),
        super(BookEmpty());

  @override
  Stream<Transition<BookEvent, BookState>> transformEvents(
    Stream<BookEvent> events,
    TransitionFunction<BookEvent, BookState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    final BookState currentState = state;

    if (event is Fetch) {
      try {
        if (currentState is BookEmpty) {
          yield BookLoading();
          final List<Book> books = await _fetchBooks();
          yield BookLoaded(books: books);
          return;
        }
        if (currentState is BookLoaded) {
          final List<Book> posts = await _fetchBooks();
          yield posts.isEmpty
              ? currentState.copyWith()
              : BookLoaded(books: currentState.books + posts);
        }
      } catch (_) {
        yield BookError();
      }
    }
  }

  Future<List<Book>> _fetchBooks() async {
    final response = await homeRepository.fetchBooks();
    if (response.status == Status.ConnectivityError) {
      //Internet problem
    }
    if (response.status == Status.Success) {
      return response.data;
    }

    return [];
  }
}
