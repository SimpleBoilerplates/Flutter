import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/feature/home/bloc/index.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/book_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  //BooksBloc _booksBloc;

  @override
  void initState() {
    super.initState();
    //_booksBloc = BlocProvider.of<BooksBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BookState>(
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
              child: Text('no books'),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkResponse(
                    enableFeedback: true,
                    child: BookWidget(book: state.books[index]),
                  ),
                );
              });
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
