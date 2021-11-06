import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/provider/books_provider.dart';
import 'package:flutter_boilerplate/feature/home/provider/home_provider.dart';
import 'package:flutter_boilerplate/feature/home/widget/row_book_widget.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(context.l10n.books),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.adjust),
            onPressed: () {
              ref.read(homeProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: _widgetContent(context, ref),
    );
  }

  Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksProvider);

    return state.when(
      loading: () {
        return _widgetShimmer(context, ref);
      },
      booksLoaded: (books) {
        return ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return RowBookWidget(book: books[index]);
            });
      },
      error: (AppException error) {
        return _widgetShimmer(context, ref);
      },
    );
  }
}
