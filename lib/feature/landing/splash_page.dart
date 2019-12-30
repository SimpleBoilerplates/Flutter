import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        S.of(context).no_results,
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
