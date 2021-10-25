import 'package:flutter_boilerplate/feature/home/state/home_state.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref.read);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._reader) : super(const HomeState.loading()) {
    _init();
  }
  final Reader _reader;
  late final TokenRepository _tokenRepository =
      _reader(tokenRepositoryProvider);

  _init() async {}

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const HomeState.loggedOut();
  }
}
