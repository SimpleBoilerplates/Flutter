import 'package:flutter/material.dart';

import '../../model/Book.dart';
import '../BookCell.dart';

class BooksWidget extends StatelessWidget {
  final List<Book> items;
  final bool visible;

  BooksWidget({Key key, @required this.items, bool visible})
      : this.visible = visible ?? items.isNotEmpty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: visible ? 1.0 : 0.0,
        child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                child: InkResponse(
                  enableFeedback: true,
                  child: BookCell(items, index),
                  // onTap: () => openDetailPage(snapshot.data, index),
                ),
              );
            }));
  }
}
