import 'package:flutter_boilerplate/app/state/app_start_state.dart';
import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/feature/home/provider/home_provider.dart';
import 'package:flutter_boilerplate/feature/home/state/home_state.dart';
import 'package:flutter_boilerplate/shared/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStartProvider =
    StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  final loginState = ref.watch(authProvider);
  final homeState = ref.watch(homeProvider);

  late AppStartState appStartState;
  appStartState = loginState is AppAuthenticated
      ? const AppStartState.authenticated()
      : const AppStartState.initial();

  return AppStartNotifier(appStartState, ref.read, loginState, homeState);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(AppStartState appStartState, this._reader, this._authState,
      this._homeState)
      : super(appStartState) {
    _init();
  }

  late final TokenRepository _tokenRepository =
      _reader(tokenRepositoryProvider);
  final AuthState _authState;
  final HomeState _homeState;
  final Reader _reader;

  Future<void> _init() async {
    _authState.maybeWhen(
        loggedIn: () {
          state = const AppStartState.authenticated();
        },
        orElse: () {});

    _homeState.maybeWhen(
        loggedOut: () {
          state = const AppStartState.unauthenticated();
        },
        orElse: () {});

    final token = await _tokenRepository.fetchToken();
    if (token != null) {
      if (mounted) {
        state = const AppStartState.authenticated();
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
