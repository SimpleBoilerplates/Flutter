import 'package:flutter/material.dart';

import 'GlobalBloc.dart';

class GlobalBlocProvider extends InheritedWidget {
  final bloc = GlobalBloc();

  GlobalBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static GlobalBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(GlobalBlocProvider)
            as GlobalBlocProvider)
        .bloc;
  }
}
