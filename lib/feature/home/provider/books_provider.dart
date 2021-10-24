import 'package:flutter_boilerplate/app/provider/app_start_provider.dart';
import 'package:flutter_boilerplate/app/state/app_start_state.dart';
import 'package:flutter_boilerplate/feature/home/repository/books_repository.dart';
import 'package:flutter_boilerplate/feature/home/state/books_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksProvider = StateNotifierProvider<BooksProvider, BooksState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return BooksProvider(ref, appStartState);
});

class BooksProvider extends StateNotifier<BooksState> {
  final ProviderRefBase ref;
  final AppStartState appStartState;

  late BooksRepository _repository;

  BooksProvider(this.ref, this.appStartState)
      : super(const BooksState.loading()) {
    _repository = ref.read(booksRepositoryProvider);
    _init();
  }

  _init() async {
    // ref.listen(appStartProvider, (value) {
    //  if (value is AppStartState) {
    appStartState.maybeWhen(
        authenticated: () {
          _fetchBooks();
        },
        orElse: () {});
    // }
    //  });
  }

  _fetchBooks() async {
    final response = await _repository.fetchBooks();
    print("_fetchBooks ${response}");

    if (mounted) {
      state = response;
    }
  }
}
