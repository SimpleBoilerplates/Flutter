import 'package:flutter/material.dart';

import '../../main/bloc/GlobalBloc.dart';
import '../../main/bloc/GlobalBlocProvider.dart';
import '../../shared/constant/Routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalBloc _globalBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _globalBloc = GlobalBlocProvider.of(context);
    _globalBloc.handleAuth();
    _listen();
  }

  @override
  void dispose() {
    _globalBloc.dispose();
    super.dispose();
  }

  void _listen() {
    _globalBloc.isAuthonticated.listen((onValue) {
      if (onValue) {
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        Navigator.pushReplacementNamed(context, Routes.signIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
