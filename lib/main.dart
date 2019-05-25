import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/shared/Routes.dart';

void main() => runApp(MyApp());
var token = "";

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: Routes().route,
    );
  }
}
