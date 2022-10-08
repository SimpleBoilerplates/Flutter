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
  BooksProvider(this._ref, this._appStartState)
      : super(const BooksState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;

  late final BooksRepository _repository = _ref.read(booksRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
        authenticated: () {
          _fetchBooks();
        },
        orElse: () {});
  }

  Future<void> _fetchBooks() async {
    final response = await _repository.fetchBooks();
    if (mounted) {
      state = response;
    }
  }
}
