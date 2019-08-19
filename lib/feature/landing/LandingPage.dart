import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void navigateAuth(BuildContext context) {
    AuthHelper.isLoggedIn().then((onValue) {
      if (onValue) {
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        Navigator.pushReplacementNamed(context, Routes.signIn);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navigateAuth(context);
    return  Container();
  }
}
