import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

List<Book> booksFromJson(List<dynamic> data) =>
    List<Book>.from(data.map((x) => Book.fromJson(x as Map<String, dynamic>)));

Book bookFromJson(String str) =>
    Book.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class Book with _$Book {
  const Book._();
  const factory Book({
    required int id,
    String? title,
    String? subTitle,
    String? description,
    String? preview,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
