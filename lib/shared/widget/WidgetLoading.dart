import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';

Widget WidgetLoading() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text("Please Wait..."), CircularProgressIndicator()],
  ));
}
