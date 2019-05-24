
import 'package:flutter/material.dart';

Widget _buildLoadingWidget() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Please Wait..."), CircularProgressIndicator()],
      ));
}