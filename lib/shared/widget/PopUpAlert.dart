import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

Widget ackAlert(BuildContext context, String title, String message) {
  return AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text(S.of(context).ok),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
