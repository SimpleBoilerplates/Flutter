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

  return AppStartNotifier(appStartState, ref, loginState, homeState);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  late TokenRepository _tokenRepository;
  final AuthState authState;
  final HomeState homeState;

  AppStartNotifier(AppStartState appStartState, ProviderRefBase ref,
      this.authState, this.homeState)
      : super(appStartState) {
    _tokenRepository = ref.read(tokenRepositoryProvider);
    //state = const AppStartState.authenticated();
    _init();
  }

  void _init() async {
    authState.maybeWhen(
        loggedIn: () {
          state = const AppStartState.authenticated();
        },
        orElse: () {});

    homeState.maybeWhen(
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
