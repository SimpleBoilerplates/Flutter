import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        "Splash",
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
