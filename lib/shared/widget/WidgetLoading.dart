import 'package:flutter/material.dart';

Widget WidgetLoading() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [const Text('Please Wait...'), const CircularProgressIndicator()],
  ));
}
