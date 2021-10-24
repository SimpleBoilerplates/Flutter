import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';

class RowBookWidget extends StatelessWidget {
  final Book book;

  const RowBookWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        enableFeedback: true,
        child: ListTile(
          leading: Text(
            '${book.id}',
            style: const TextStyle(fontSize: 10.0),
          ),
          title: Text(book.title ?? ""),
          isThreeLine: true,
          subtitle: Text(book.subTitle ?? ""),
          dense: true,
        ));
  }
}
