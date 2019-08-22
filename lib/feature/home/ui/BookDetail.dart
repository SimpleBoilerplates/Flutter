import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  String title;
  String subTitle;
  String description;
  String preview;

  BookDetail({this.title, this.subTitle, this.description, this.preview});

  @override
  State<StatefulWidget> createState() {
    return _BookDetailState(title, subTitle, description, preview);
  }
}

class _BookDetailState extends State<BookDetail> {
  String title;
  String subTitle;
  String description;
  String preview;

  _BookDetailState(this.title, this.subTitle, this.description, this.preview);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
