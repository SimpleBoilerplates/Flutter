import 'package:flutter/material.dart';

import '../../blocs/AuthBlocProvider.dart';
import '../widget/SignUpWidget.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: Colors.amber),
        alignment: Alignment(0.0, 0.0),
        child: AuthBlocProvider(child: SignUpWidget()));
  }
}
