import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/base/data_state.dart';
import 'package:flutter_boilerplate/feature/authentication/blocs/blocs.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/books_widget.dart';

import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/common/widget/empty_widget.dart';
import 'package:flutter_boilerplate/common/widget/loading_widget.dart';
import 'package:flutter_boilerplate/common/widget/widget_error.dart';
import '../../blocs/home_bloc.dart';
import '../../blocs/home_bloc_provider.dart';
import '../widget/books_widget.dart';
import 'package:flutter_boilerplate/feature/home/blocs/bloc.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/book_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  BooksBloc _booksBloc;

  @override
  void initState() {
    super.initState();
    _booksBloc = BlocProvider.of<BooksBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<BooksBloc, BookState>(
      builder: (context, state) {
        if (state is BookEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BookError) {
          return const Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is BookLoaded) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return index >= state.books.length
                ? const LoadingWidget(visible: true)
                : BookWidget(book: state.books[index]);
          });
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
