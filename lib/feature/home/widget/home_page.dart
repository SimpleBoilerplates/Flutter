import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/feature/home/provider/books_provider.dart';
import 'package:flutter_boilerplate/feature/home/widget/row_book_widget.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/route/app_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("home".tr()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.adjust),
            onPressed: () {
              ref.read(routerProvider).go(SignInRoute.path);
              //ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: _widgetContent(context, ref),
    );
  }

  Widget _widgetLoading(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text('loading'.tr()),
    );
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksNotifierProvider);

    return state.when(
      loading: () {
        return _widgetLoading(context, ref);
      },
      booksLoaded: (books) {
        return ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return RowBookWidget(book: books[index]);
            });
      },
      error: (AppException error) {
        return _widgetLoading(context, ref);
      },
    );
  }
}
