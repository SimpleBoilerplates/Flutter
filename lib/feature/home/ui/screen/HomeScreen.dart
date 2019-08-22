import 'package:flutter/material.dart';

import '../../blocs/HomeBlocProvider.dart';
import '../widget/HomeWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.transparent),
      alignment: Alignment(0.0, 0.0),
      child: HomeBlocProvider(child: HomeWidget()),
    );
  }
}
