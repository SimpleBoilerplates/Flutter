import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_boilerplate/common/bloc/connectivity/connectivity_event.dart';
import 'package:flutter_boilerplate/common/bloc/connectivity/connectivity_state.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription subscription;

  ConnectivityBloc() : super(AppStarted());

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  @override
  Stream<Transition<ConnectivityEvent, ConnectivityState>> transformEvents(
    Stream<ConnectivityEvent> events,
    TransitionFunction<ConnectivityEvent, ConnectivityState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ConnectivityState> mapEventToState(ConnectivityEvent event) async* {
    final ConnectivityState currentState = state;

    if (currentState is AppStarted) {
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult connectivityResult) {
        // Got a new connectivity status!
        if (connectivityResult == ConnectivityResult.mobile) {
          InternetAvailable();
          return true;
        } else if (connectivityResult == ConnectivityResult.wifi) {
          InternetAvailable();
          return true;
        } else {
          InternetUnAvailable();
          return false;
        }
      });
    }
  }
}
