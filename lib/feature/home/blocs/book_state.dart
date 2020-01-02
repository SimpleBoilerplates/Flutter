import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookEmpty extends BookState {}

class BookLoading extends BookState {}

class BookError extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;

  const BookLoaded({this.books});

  BookLoaded copyWith({List<Book> posts}) {
    return BookLoaded(books: posts ?? this.books);
  }

  @override
  List<Object> get props => [books];

  @override
  String toString() => 'PostLoaded { posts: ${books.length} }';
}
