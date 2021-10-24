import 'package:flutter_boilerplate/app/provider/app_start_provider.dart';
import 'package:flutter_boilerplate/feature/home/state/home_state.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(ProviderRefBase ref) : super(const HomeState.loading()) {
    _tokenRepository = ref.read(tokenRepositoryProvider);
    _init();
  }

  late TokenRepository _tokenRepository;

  _init() async {}

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const HomeState.loggedOut();
  }
}
