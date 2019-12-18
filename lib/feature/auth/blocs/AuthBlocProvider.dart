import 'package:flutter/material.dart';

import 'AuthBloc.dart';

class AuthBlocProvider extends InheritedWidget {
  final AuthBloc bloc = AuthBloc();

  AuthBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthBlocProvider>().bloc;
  }
}
