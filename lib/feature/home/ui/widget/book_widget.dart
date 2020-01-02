import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;

  const BookWidget({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${book.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(book.title),
      isThreeLine: true,
      subtitle: Text(book.subTitle),
      dense: true,
    );
  }
}
