import 'package:flutter/material.dart';
import './shared/constant/Routes.dart';
void main() {
  //FluroRouter.setupRouter();
  runApp(MyApp());
}


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
