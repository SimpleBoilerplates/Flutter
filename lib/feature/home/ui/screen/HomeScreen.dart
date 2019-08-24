import 'package:flutter/material.dart';

import '../../blocs/HomeBlocProvider.dart';
import '../widget/HomeWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeBlocProvider(child: HomeWidget()),
    );
  }
}
